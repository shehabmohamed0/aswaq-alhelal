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
      'RequiredObject.pure() valid equals false',
      () {
        const test = RequiredObject<int>.pure();
        expect(test.valid, false);
      },
    );
    test(
      'RequiredObject.pure() invalid == true',
      () {
        const test = RequiredObject<int>.pure();
        expect(test.invalid, true);
      },
    );
  });
}
