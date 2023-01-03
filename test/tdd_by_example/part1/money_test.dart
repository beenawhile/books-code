import 'package:books_code/tdd_by_example/part1/bank.dart';
import 'package:books_code/tdd_by_example/part1/expression.dart';
import 'package:books_code/tdd_by_example/part1/money.dart';
import 'package:test/test.dart';

void main() {
  test(
    "Money should be equal with identical amount",
    () async {
      expect(Money.dollar(5), Money.dollar(5));
      expect(Money.dollar(5), isNot(equals(Money.dollar(6))));
      expect(Money.franc(5), isNot(equals(Money.dollar(5))));
    },
  );

  test(
    "Money should return a respective currency String",
    () async {
      expect(Money.dollar(1).currency, "USD");
      expect(Money.franc(1).currency, "CHF");
    },
  );

  test(
    "Money should calculate addition",
    () async {
      Money five = Money.dollar(5);
      Expression sum = five.plus(five);
      final bank = Bank();
      Money reduced = bank.reduce(sum, "USD");
      expect(reduced, Money.dollar(10));
    },
  );

  test(
    "Money.plus() should return Sum",
    () async {
      Money five = Money.dollar(5);
      Expression result = five.plus(five);
      Sum sum = result as Sum;
      expect(five, sum.augend);
      expect(five, sum.addend);
    },
  );

  test(
    "Money.reduce should return Money",
    () async {
      final bank = Bank();
      final result = bank.reduce(Money.dollar(1), "USD");
      expect(result, Money.dollar(1));
    },
  );

  test(
    "Money.reduce should convert itself with different currency",
    () async {
      final bank = Bank();
      bank.addRate("CHF", "USD", 2);
      final result = bank.reduce(Money.franc(2), "USD");
      expect(result, Money.dollar(1));
    },
  );

  test(
    "Money should support mixed currency addition",
    () async {
      final Expression fiveBucks = Money.dollar(5);
      final Expression tenFrancs = Money.franc(10);
      final bank = Bank();
      bank.addRate("CHF", "USD", 2);
      final result = bank.reduce(fiveBucks.plus(tenFrancs), "USD");
      expect(result, Money.dollar(10));
    },
  );

  test(
    "Sum plus money should be valid",
    () async {
      final Expression fiveBucks = Money.dollar(5);
      final Expression tenFrancs = Money.franc(10);
      final bank = Bank();
      bank.addRate("CHF", "USD", 2);
      final sum = Sum(fiveBucks, tenFrancs).plus(fiveBucks);
      final result = bank.reduce(sum, "USD");
      expect(result, Money.dollar(15));
    },
  );
  test(
    "Sum times money should be valid",
    () async {
      final Expression fiveBucks = Money.dollar(5);
      final Expression tenFrancs = Money.franc(10);
      final bank = Bank();
      bank.addRate("CHF", "USD", 2);
      final sum = Sum(fiveBucks, tenFrancs).times(2);
      final result = bank.reduce(sum, "USD");
      expect(result, Money.dollar(20));
    },
  );
}
