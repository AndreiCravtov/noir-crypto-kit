use acir::brillig::ForeignCallParam;
use nargo::ops::{ForeignCallExecutor, NargoForeignCallResult};
use acvm::pwg::ForeignCallWaitInfo;
use acir::brillig::ForeignCallResult;
use noirc_printable_type::{ForeignCallError, PrintableValueDisplay};

pub enum ForeignCall {
    Print,
    AssertMessage
}

impl std::fmt::Display for ForeignCall {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.name())
    }
}

impl ForeignCall {
    pub(crate) fn name(&self) -> &'static str {
        match self {
            ForeignCall::Print => "print",
            ForeignCall::AssertMessage => "assert_message"
        }
    }

    pub(crate) fn lookup(op_name: &str) -> Option<ForeignCall> {
        match op_name {
            "print" => Some(ForeignCall::Print),
            "assert_message" => Some(ForeignCall::AssertMessage),
            _ => None,
        }
    }
}

pub struct DefaultForeignCallExecutor;

impl DefaultForeignCallExecutor {
    fn execute_print(foreign_call_inputs: &[ForeignCallParam]) -> Result<(), ForeignCallError> {
        let skip_newline = foreign_call_inputs[0].unwrap_value().is_zero();

        let foreign_call_inputs =
            foreign_call_inputs.split_first().ok_or(ForeignCallError::MissingForeignCallInputs)?.1;
        let display_string = Self::format_printable_value(foreign_call_inputs, skip_newline)?;

        print!("{display_string}");

        Ok(())
    }

    fn execute_assert_message(
        foreign_call_inputs: &[ForeignCallParam],
    ) -> Result<NargoForeignCallResult, ForeignCallError> {
        let display_string = Self::format_printable_value(foreign_call_inputs, true)?;
        Ok(display_string.into())
    }

    fn format_printable_value(
        foreign_call_inputs: &[ForeignCallParam],
        skip_newline: bool,
    ) -> Result<String, ForeignCallError> {
        let display_values: PrintableValueDisplay = foreign_call_inputs.try_into()?;
        let result = format!("{display_values}{}", if skip_newline { "" } else { "\n" });
        Ok(result)
    }
}

impl ForeignCallExecutor for DefaultForeignCallExecutor {
    fn execute(&mut self, foreign_call: &acvm::pwg::ForeignCallWaitInfo,
    ) -> Result<NargoForeignCallResult, noirc_printable_type::ForeignCallError> {
        let foreign_call_name = foreign_call.function.as_str();
        match ForeignCall::lookup(foreign_call_name) {
            Some(ForeignCall::Print) => {
                Self::execute_print(&foreign_call.inputs)?;
                Ok(ForeignCallResult::default().into())
            }
            Some(ForeignCall::AssertMessage) => Self::execute_assert_message(&foreign_call.inputs),
            None => {
                

                panic!("foreign call not found: {}", foreign_call_name)
            }
        }
    }
}