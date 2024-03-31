mod const;
mod oracle;
mod hash;

use const::{N, M, P};

fn main(point: Field, input: pub [Field; N]) {
    let x_s_0 = hash::evaluate_input_0(point, input);
    print(x_s_0);
    assert(x_s_0.lt(P));
}

#[test]
fn test_main() {}
