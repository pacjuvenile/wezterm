use std::time::Instant;

const RELATIVE_CORNERS: [Point; 4] = [
    Point { x: 0.0, y: 0.0 },
    Point { x: 1.0, y: 0.0 },
    Point { x: 0.0, y: 1.0 },
    Point { x: 1.0, y: 1.0 },
];

#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct Point {
    pub x: f32,
    pub y: f32,
}

#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct CursorRect {
    pub x: f32,
    pub y: f32,
    pub width: f32,
    pub height: f32,
}

impl CursorRect {
    fn center(self) -> Point {
        Point {
            x: self.x + self.width * 0.5,
            y: self.y + self.height * 0.5,
        }
    }

    fn corner(self, relative: Point) -> Point {
        Point {
            x: self.x + self.width * relative.x,
            y: self.y + self.height * relative.y,
        }
    }
}

#[derive(Clone, Copy, Debug)]
pub struct CursorAnimationSettings {
    pub animation_length: f32,
    pub short_animation_length: f32,
    pub trail_size: f32,
}

#[derive(Clone, Copy, Debug, Default)]
struct CriticallyDampedSpring {
    position: f32,
    velocity: f32,
}

impl CriticallyDampedSpring {
    fn update(&mut self, dt: f32, animation_length: f32) -> bool {
        if animation_length <= dt {
            self.reset();
            return false;
        }
        if self.position == 0.0 {
            return false;
        }

        // Same critically damped analytical spring used by Neovide. Omega is
        // chosen so the cursor reaches a 2% tolerance in animation_length.
        let omega = 4.0 / animation_length;
        let a = self.position;
        let b = self.position * omega + self.velocity;
        let decay = (-omega * dt).exp();

        self.position = (a + b * dt) * decay;
        self.velocity = decay * (-a * omega - b * dt * omega + b);

        if self.position.abs() < 0.01 {
            self.reset();
            false
        } else {
            true
        }
    }

    fn reset(&mut self) {
        self.position = 0.0;
        self.velocity = 0.0;
    }
}

#[derive(Clone, Copy, Debug, Default)]
struct AnimatedCorner {
    current: Point,
    previous_destination: Point,
    spring_x: CriticallyDampedSpring,
    spring_y: CriticallyDampedSpring,
    animation_length: f32,
}

impl AnimatedCorner {
    fn snap(&mut self, destination: Point) {
        self.current = destination;
        self.previous_destination = destination;
        self.spring_x.reset();
        self.spring_y.reset();
    }

    fn jump(
        &mut self,
        destination: Point,
        rect: CursorRect,
        alignment: f32,
        settings: CursorAnimationSettings,
    ) {
        let jump_x = (destination.x - self.previous_destination.x) / rect.width.max(1.0);
        let jump_y = (destination.y - self.previous_destination.y) / rect.height.max(1.0);
        self.animation_length = if jump_x.abs() <= 2.001 && jump_y.abs() <= 0.001 {
            settings
                .animation_length
                .min(settings.short_animation_length)
        } else {
            let leading = settings.animation_length * (1.0 - settings.trail_size).clamp(0.0, 1.0);
            settings.animation_length + (leading - settings.animation_length) * alignment
        };

        self.spring_x.position = destination.x - self.current.x;
        self.spring_y.position = destination.y - self.current.y;
        self.previous_destination = destination;
    }

    fn update(&mut self, destination: Point, dt: f32) -> bool {
        let mut animating = self.spring_x.update(dt, self.animation_length);
        animating |= self.spring_y.update(dt, self.animation_length);
        self.current.x = destination.x - self.spring_x.position;
        self.current.y = destination.y - self.spring_y.position;
        animating
    }
}

#[derive(Debug, Default)]
pub struct CursorAnimation {
    corners: [AnimatedCorner; 4],
    previous_rect: Option<CursorRect>,
    last_update: Option<Instant>,
}

impl CursorAnimation {
    pub fn reset(&mut self) {
        self.previous_rect = None;
        self.last_update = None;
    }

    pub fn update(
        &mut self,
        now: Instant,
        rect: CursorRect,
        settings: CursorAnimationSettings,
    ) -> ([Point; 4], bool) {
        let destinations = RELATIVE_CORNERS.map(|relative| rect.corner(relative));
        let Some(previous_rect) = self.previous_rect else {
            for (corner, destination) in self.corners.iter_mut().zip(destinations) {
                corner.snap(destination);
            }
            self.previous_rect = Some(rect);
            self.last_update = Some(now);
            return (destinations, false);
        };

        let dt = self
            .last_update
            .map(|last| now.saturating_duration_since(last).as_secs_f32())
            .unwrap_or_default();
        self.last_update = Some(now);

        if previous_rect != rect {
            let old_center = previous_rect.center();
            let new_center = rect.center();
            let dx = new_center.x - old_center.x;
            let dy = new_center.y - old_center.y;
            let length = (dx * dx + dy * dy).sqrt();
            let (dir_x, dir_y) = if length > f32::EPSILON {
                (dx / length, dy / length)
            } else {
                (0.0, 0.0)
            };
            let raw_alignment = RELATIVE_CORNERS.map(|relative| {
                let corner_x = relative.x - 0.5;
                let corner_y = relative.y - 0.5;
                corner_x * dir_x + corner_y * dir_y
            });
            let min = raw_alignment.iter().copied().fold(f32::INFINITY, f32::min);
            let max = raw_alignment
                .iter()
                .copied()
                .fold(f32::NEG_INFINITY, f32::max);
            let range = max - min;

            for (index, (corner, destination)) in
                self.corners.iter_mut().zip(destinations).enumerate()
            {
                let alignment = if range > f32::EPSILON {
                    ((raw_alignment[index] - min) / range).clamp(0.0, 1.0)
                } else {
                    1.0
                };
                corner.jump(destination, rect, alignment, settings);
            }
            self.previous_rect = Some(rect);
        }

        let mut animating = false;
        for (corner, destination) in self.corners.iter_mut().zip(destinations) {
            animating |= corner.update(destination, dt);
        }

        (self.corners.map(|corner| corner.current), animating)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::time::Duration;

    #[test]
    fn front_edge_leads_and_spring_converges() {
        let start = Instant::now();
        let settings = CursorAnimationSettings {
            animation_length: 0.15,
            short_animation_length: 0.04,
            trail_size: 1.0,
        };
        let mut animation = CursorAnimation::default();
        animation.update(
            start,
            CursorRect {
                x: 0.0,
                y: 0.0,
                width: 10.0,
                height: 20.0,
            },
            settings,
        );
        let (corners, animating) = animation.update(
            start + Duration::from_millis(16),
            CursorRect {
                x: 100.0,
                y: 20.0,
                width: 10.0,
                height: 20.0,
            },
            settings,
        );
        assert!(animating);
        assert!(corners[1].x > corners[0].x + 10.0);

        let (corners, animating) = animation.update(
            start + Duration::from_secs(1),
            CursorRect {
                x: 100.0,
                y: 20.0,
                width: 10.0,
                height: 20.0,
            },
            settings,
        );
        assert!(!animating);
        assert_eq!(corners[0], Point { x: 100.0, y: 20.0 });
        assert_eq!(corners[3], Point { x: 110.0, y: 40.0 });
    }
}
