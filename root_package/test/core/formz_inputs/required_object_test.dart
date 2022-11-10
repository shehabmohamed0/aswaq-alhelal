import 'package:flutter_test/flutter_test.dart';
import 'package:root_package/core/form_inputs/required_object.dart';

void main() {
  group('RequiredObject', () {
    test(
      'RequiredObject.pure() is invalid',
      () {
        const test = RequiredObject<int>.pure();
        expect(test.valid, false);
      },
    );
    test(
      'RequiredObject.dirty() is invalid',
      () {
        const test1 = RequiredObject<int>.pure();
        final test = RequiredObject<int>.dirty(test1.value);
        expect(test.invalid, true);
        expect(test.error, RequiredObjectValidationError.invalid);
      },
    );
  });
}
