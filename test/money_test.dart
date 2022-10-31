import 'package:tdd_by_example/bank.dart';
import 'package:tdd_by_example/expression.dart';
import 'package:tdd_by_example/franc.dart';
import 'package:tdd_by_example/money.dart';
import 'package:test/test.dart';

void main() {
  test(
    "times() should do right multiplication",
    () async {
      final Money five = Money.dollar(5);
      expect(Money.dollar(10).equals(five.times(2)), true);
      expect(Money.dollar(15).equals(five.times(3)), true);
    },
  );

  test(
    "equals() should evaluate values right with same amount",
    () async {
      expect(Money.dollar(5).equals(Money.dollar(5)), true);
      expect(Money.dollar(5).equals(Money.dollar(6)), false);

      expect(Money.dollar(5).equals(Money.franc(5)), false);
    },
  );

  test(
    "Subclasses of Money returns right currency",
    () async {
      expect("USD", Money.dollar(1).currency);
      expect("CHF", Money.franc(1).currency);
    },
  );
  test(
    "Different classes should be equal",
    () async {
      expect(Money(10, "CHF").equals(Franc(10, "CHF")), true);
    },
  );

  test(
    "addition function should return right summed Money",
    () async {
      final five = Money.dollar(5);
      Expression sum = five.plus(five);

      final bank = Bank();
      Money reduced = bank.reduce(sum, "USD");
      expect(Money.dollar(10).equals(reduced), true);
    },
  );
}
