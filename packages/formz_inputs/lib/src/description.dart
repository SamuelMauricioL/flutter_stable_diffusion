import 'package:formz/formz.dart';

/// Validation error for Description [FormzInput]
enum DescriptionValidationError {
  /// Description is empty
  empty,

  /// Description is too short (generic validation error)
  tooShort,
}

/// {@template description_form_input}
/// Description form input.
/// {@endtemplate}
class DescriptionFormInput
    extends FormzInput<String, DescriptionValidationError> {
  /// {@macro description_form_input}
  const DescriptionFormInput.pure() : super.pure('');

  /// {@macro description_form_input}
  const DescriptionFormInput.dirty([super.value = '']) : super.dirty();

  @override
  DescriptionValidationError? validator(String value) {
    if (value.isEmpty) return DescriptionValidationError.empty;

    if (value.length < 2) {
      return DescriptionValidationError.tooShort;
    }
    return null;
  }
}
