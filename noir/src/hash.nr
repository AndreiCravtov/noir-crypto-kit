use crate::const::{N, M, P, NEGATIVE, ADD, MULTIPLY, EXPONENTIATE, MULTIPLIER_POLYNOMIAL_0, MULTIPLIER_POLYNOMIAL_1};

// pub fn evaluate_input(point: Field, inputs: [[Field; N]; M]) -> [Field; M] { // was 
//     // compute: p_s = s^64 + 1
//     let mut p_s = EXPONENTIATE[point * N + 63]; // s^63
//     p_s = MULTIPLY[p_s*P + p_s]; // s^64
//     p_s = ADD[p_s + 1]; // s^64 + 1

//     // compute: y = m_0(s)
//     let mut y = 0;
//     for i in 0..64 {
//         let i_field = i as Field;
//         let s_i = EXPONENTIATE[point * N + i_field];
//         let m_i = MULTIPLIER_POLYNOMIAL_0[i_field];
//         let product = MULTIPLY[s_i * P + m_i];
//         y = ADD[y + product];
//     }
//     // compute: x_s_0 = [x_0*m_0](s)
//     let mut x_s_0 = MULTIPLY[y * P + inputs[0][0]];
//     for i in 1..64 {
//         let i_field = i as Field;
//         let sub_term = NEGATIVE[MULTIPLY[p_s * P + MULTIPLIER_POLYNOMIAL_0[N - i_field]]];
//         y = ADD[MULTIPLY[y*P + point] + sub_term];
//         x_s_0 = ADD[x_s_0 + MULTIPLY[y * P + inputs[0][i_field]]];
//     }

//     // // compute: y = m_1(s)
//     // y = 0;
//     // for i in 0..64 {
//     //     let i_field = i as Field;
//     //     let s_i = EXPONENTIATE[point * N + i_field];
//     //     let m_i = MULTIPLIER_POLYNOMIAL_1[i_field];
//     //     let product = MULTIPLY[s_i * P + m_i];
//     //     y = ADD[y + product];
//     // }
//     // // compute: x_s_1 = [x_1*m_1](s)
//     // let mut x_s_1 = MULTIPLY[y * P + inputs[1][0]];
//     // for i in 1..64 {
//     //     let i_field = i as Field;
//     //     let sub_term = NEGATIVE[MULTIPLY[p_s * P + MULTIPLIER_POLYNOMIAL_1[N - i_field]]];
//     //     y = ADD[MULTIPLY[y*P + point] + sub_term];
//     //     x_s_1 = ADD[x_s_1 + MULTIPLY[y * P + inputs[1][i_field]]];
//     // }

//     // // compute: y = m_2(s)
//     // y = 0;
//     // for i in 0..64 {
//     //     let i_field = i as Field;
//     //     let s_i = EXPONENTIATE[point * N + i_field];
//     //     let m_i = MULTIPLIER_POLYNOMIAL_2[i_field];
//     //     let product = MULTIPLY[s_i * P + m_i];
//     //     y = ADD[y + product];
//     // }
//     // // compute: x_s_2 = [x_2*m_2](s)
//     // let mut x_s_2 = MULTIPLY[y * P + inputs[2][0]];
//     // for i in 1..64 {
//     //     let i_field = i as Field;
//     //     let sub_term = NEGATIVE[MULTIPLY[p_s * P + MULTIPLIER_POLYNOMIAL_2[N - i_field]]];
//     //     y = ADD[MULTIPLY[y*P + point] + sub_term];
//     //     x_s_2 = ADD[x_s_2 + MULTIPLY[y * P + inputs[2][i_field]]];
//     // }

//     //
//     [0; M]
// }

pub fn evaluate_input_0(point: Field, input: [Field; N]) -> Field {
    // compute: p_s = s^64 + 1
    let mut p_s = EXPONENTIATE[point * N + 63]; // s^63
    p_s = MULTIPLY[p_s*P + p_s]; // s^64
    p_s = ADD[p_s + 1]; // s^64 + 1

    // compute: y = m_0(s)
    let mut y = 0;
    for i in 0..64 {
        let i_field = i as Field;
        let s_i = EXPONENTIATE[point * N + i_field];
        let m_i = MULTIPLIER_POLYNOMIAL_0[i_field];
        let product = MULTIPLY[s_i * P + m_i];
        y = ADD[y + product];
    }
    // compute: x_s_0 = [x_0*m_0](s)
    let mut x_s_0 = MULTIPLY[y * P + input[0]];
    for i in 1..64 {
        let i_field = i as Field;
        let sub_term = NEGATIVE[MULTIPLY[p_s * P + MULTIPLIER_POLYNOMIAL_0[N - i_field]]];
        y = ADD[MULTIPLY[y*P + point] + sub_term];
        x_s_0 = ADD[x_s_0 + MULTIPLY[y * P + input[i_field]]];
    }

    // return
    x_s_0
}
