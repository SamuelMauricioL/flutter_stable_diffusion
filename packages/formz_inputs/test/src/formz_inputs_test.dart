// ignore_for_file: prefer_const_constructors

import 'package:formz_inputs/formz_inputs.dart';
import 'package:test/test.dart';

void main() {
  const descriptionString = 'a photograph of an astronaut riding a horse';
  group('DescriptionFormInput', () {
    group('constructors', () {
      test(
        'pure creates correct instance',
        () {
          final description = DescriptionFormInput.pure();
          expect(description.value, '');
          expect(description.pure, true);
        },
      );

      test(
        'dirty creates correct instance',
        () {
          final description = DescriptionFormInput.dirty(descriptionString);
          expect(description.value, descriptionString);
          expect(description.pure, false);
        },
      );
    });

    group('validator', () {
      test(
        'returns empty error when description is empty',
        () {
          expect(
            DescriptionFormInput.dirty().error,
            DescriptionValidationError.empty,
          );
        },
      );

      test(
        'returns too short error when description length is shorter than 2',
        () {
          expect(
            DescriptionFormInput.dirty(descriptionString[0]).error,
            DescriptionValidationError.tooShort,
          );
        },
      );

      test(
        'is valid when description is valid',
        () {
          expect(
            DescriptionFormInput.dirty(descriptionString).error,
            isNull,
          );
        },
      );
    });
  });
}
