import 'package:aswaqalhelal/core/form_inputs/required_object.dart';
import 'package:flutter_test/flutter_test.dart';

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
      'RequiredObject.pure() invalid == flase',
      () {
        const test = RequiredObject<int>.pure();
        expect(test.invalid, true);
      },
    );
  });
}
