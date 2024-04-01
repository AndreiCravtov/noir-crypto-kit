global IMG_1280_720_24_BYTES = 2_764_800;
global DIGEST_SIZE_BYTES = 128;

#[oracle(swifft_hash)]
unconstrained fn get_swifft_hash(img_bytes: [Field; IMG_1280_720_24_BYTES]) -> [Field; DIGEST_SIZE_BYTES] {}

unconstrained fn swifft_hash(img_bytes: [Field; IMG_1280_720_24_BYTES]) -> [Field; DIGEST_SIZE_BYTES] {
    get_swifft_hash(img_bytes)
}

/// It says `Field`, but each field represents a byte element. 
pub fn hash_img_1280_720_24(img_bytes: [Field; IMG_1280_720_24_BYTES]) -> [Field; DIGEST_SIZE_BYTES] {
    // WARNING - THIS IS A PROTOTYPE IMPLEMENTATION
    //
    // The hash will be adjusted in the future, such that verification of
    // correctness can be implemented within the cuircit more efficiently.
    //
    // This would involve playing around with the field parameters, and would
    // take some time, but in theory, should not be very computationally expensive
    // (as per this paper: https://eprint.iacr.org/2022/1633.pdf)
    //
    // For now this is just proof of concept - not secure
    swifft_hash(img_bytes)
}
