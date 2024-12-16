// delay line
// https://youtu.be/Yom9E-67bdI?si=mMvh0MEmn_ut0_Mp&t=1189

use num::Float;

pub struct DLine<T: Float = f32> {
    buffer: Vec<T>,
    index: usize,
}

impl<T: Float> DLine<T> {
    pub fn new(length: usize) -> Self {
        Self {
            buffer: vec![T::zero(); length],
            index: 0,
        }
    }
}
