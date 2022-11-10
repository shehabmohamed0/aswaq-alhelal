import 'package:flutter_test/flutter_test.dart';
import 'package:root_package/core/form_inputs/nullable_number.dart';

void main() {
  group(
    'Nullable Number',
    () {
      test(
        'Nullable number should be pure',
        () {
          const number = NullableNumber.purePrice();
          expect(number.pure, true);
        },
      );
      test(
        'pure Nullable number should be valid',
        () {
          const number = NullableNumber.purePrice();
          expect(number.valid, true);
        },
      );
      test(
        r'Dirty Nullable number text should be "5" ',
        () {
          final number = NullableNumber<int>.dirtyPrice(number: 5);
          expect(number.stringValue(), '5');
        },
      );
      test(
        r'Dirty Nullable number with text ",566" should be invalid',
        () {
          final number =
              NullableNumber<double>.dirtyStringPrice(priceText: ',566');
          expect(number.invalid, true);
        },
      );
      test(
        'int Nullable number with dirty double text should be invalid',
        () {
          final number = NullableNumber<int>.dirtyStringPrice(priceText: '1.0');
          expect(number.invalid, true);
        },
      );
      test(
        'double Nullable number with dirty int text should be valid',
        () {
          final number = NullableNumber<double>.dirtyStringPrice(
              priceText: '500', acceptZero: true);
          expect(number.valid, true);
        },
      );
      test(
        'int Nullable number with dirty double zero text should be invalid',
        () {
          final number = NullableNumber<int>.dirtyStringPrice(
              priceText: '0.0', acceptZero: true);
          expect(number.priceText, '0.0');
          expect(number.invalid, true);
        },
      );
      test(
        'not negative int Nullable number  with dirty negative double text should be invalid',
        () {
          final number = NullableNumber<int>.dirtyStringPrice(
              priceText: '-1.4', acceptZero: true);
          expect(number.invalid, true);
        },
      );
      test(
        'int Nullable number with dirty double text should be invalid',
        () {
          final number = NullableNumber<double>.dirtyStringPrice(
              priceText: '-1', acceptZero: true);
          expect(number.invalid, true);
        },
      );
      test(
        'Nullable number validation message',
        () {
          final number =
              NullableNumber<double>.dirtyStringPrice(priceText: ',88');
          expect(number.error, NullableNumberValidationError.invalid);
        },
      );
      test(
        'Nullable number Make dirty with null should be valid',
        () {
          const number = NullableNumber<double>.purePrice();
          final newNumber = NullableNumber<double>.dirtyPrice(number: null);
          expect(newNumber.valid, true);
        },
      );
    },
  );
}
