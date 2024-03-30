mod fs;
mod foreign_calls;

use acir::circuit;
use thiserror::Error;
use nargo::{artifacts::{debug::DebugArtifact, program::ProgramArtifact}, errors::try_to_diagnose_runtime_error};
use noirc_abi::input_parser::{Format, InputValue};
use noirc_driver::CompiledProgram;
use bn254_blackbox_solver::Bn254BlackBoxSolver;

use fs::read_inputs_from_file;
use foreign_calls::DefaultForeignCallExecutor;

#[derive(Error, Debug)]
pub enum GetProgramError {
    #[error("IO error: {0}")]
    IoError(#[from] std::io::Error),
    #[error("JSON parsing er\ror: {0}")]
    JsonError(#[from] serde_json::Error)
}

pub fn get_compiled_program(file_path: &str) -> Result<ProgramArtifact, GetProgramError> { // might need to be "artifact" or whatever
    let bytes: Vec<u8> = std::fs::read(file_path)?;
    let program_artifact = serde_json::from_slice(&bytes)?;
    return Ok(program_artifact);
}

fn main() {
    // parse program
    let compiled_program = get_compiled_program("./../noir/target/noir.json").unwrap();
    // println!("{:#?}", compiled_program);

    // Parse the initial witness values from Prover.toml
    let (inputs_map, input_value) = 
        read_inputs_from_file("./../noir/", "Prover.toml", Format::Toml, &compiled_program.abi).unwrap();
    println!("{:#?}", inputs_map);
    println!("{:#?}", input_value);


    // bloackbox solver and witness map
    let blackbox_solver = Bn254BlackBoxSolver::new();   
    let initial_witness = compiled_program.abi.encode(&inputs_map, None).unwrap();
    
    // solved witness
    let solved_witness = nargo::ops::execute_circuit(
        &compiled_program.bytecode,
        initial_witness,
        &blackbox_solver,
        &mut DefaultForeignCallExecutor {},
    ).unwrap();

    let public_abi = compiled_program.abi.public_abi();
    let (_, return_value) = public_abi.decode(&solved_witness).unwrap();
    println!("{:#?}", return_value);
    println!("{:#?}", solved_witness);
}
