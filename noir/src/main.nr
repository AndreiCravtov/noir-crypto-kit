mod hash;

use hash::{IMG_1280_720_24_BYTES, hash_img_1280_720_24};

fn main(input: pub [Field; IMG_1280_720_24_BYTES]) {
    let out = hash_img_1280_720_24(input);
}

#[test]
fn test_main() {}
