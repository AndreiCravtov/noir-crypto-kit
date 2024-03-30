mod const;

#[oracle(get_sqrt)]
unconstrained fn sqrt(number: Field) -> Field {}

unconstrained fn get_sqrt(number: Field) -> Field {
    sqrt(number)
}

fn main(x: Field, y: pub Field) {
    let mut acc: Field = 0;
    for i in 0..const::P {
        for j in 0..const::P {
            acc += const::EXPONENTIATE[i][j];
        }
    }
    assert(acc.lt(x));
    assert(x != y);
}

#[test]
fn test_main() {
    main(1, 2);
    // Uncomment to make test fail
    // main(1, 1);
}
