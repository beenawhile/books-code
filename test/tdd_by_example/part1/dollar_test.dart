import 'package:books_code/tdd_by_example/part1/money.dart';
import 'package:test/test.dart';

void main() {
  test(
    "Dollar.times should calculate multiplication",
    () async {
      Money five = Money.dollar(5);
      expect(five.times(2), Money.dollar(10));
      expect(five.times(3), Money.dollar(15));
    },
  );

  test(
    "Dollar should be equal to the other Dollar with same amount",
    () async {
      expect(Money.dollar(10), Money.dollar(5).times(2));
      expect(Money.dollar(5), isNot(equals(Money.dollar(6))));
    },
  );
}
