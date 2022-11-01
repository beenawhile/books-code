import 'package:tdd_by_example/bank.dart';
import 'package:tdd_by_example/expression.dart';
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
      expect(Money(10, "CHF").equals(Money.franc(10)), true);
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

  test(
    "Money.plus() should return Sum",
    () async {
      Money five = Money.dollar(5);
      Expression result = five.plus(five);
      Sum sum = result as Sum;
      expect(five.equals(sum.augend), true);
      expect(five.equals(sum.addend), true);
    },
  );

  test(
    "Bank.reduce(Sum,~) should return a valid Money",
    () async {
      Expression sum = Sum(Money.dollar(3), Money.dollar(4));
      Bank bank = Bank();
      Money result = bank.reduce(sum, "USD");
      expect(Money.dollar(7).equals(result), true);
    },
  );

  test(
    "Bank.reduce(Money,~) should return a valid Money",
    () async {
      Bank bank = Bank();
      Money result = bank.reduce(Money.dollar(1), "USD");
      expect(Money.dollar(1).equals(result), true);
    },
  );

  test(
    "Bank should reduce money in different currency",
    () async {
      Bank bank = Bank();
      bank.addRate("CHF", "USD", 2);
      Money result = bank.reduce(Money.franc(2), "USD");
      expect(result.equals(Money.dollar(1)), true);
    },
  );

  test(
    "Bank.rate should be identical if currencies are same",
    () async {
      expect(1, Bank().rate("USD", "USD"));
    },
  );

  test(
    "Expression should support mixed addition of currency",
    () async {
      Expression fiveBucks = Money.dollar(5);
      Expression tenFrancs = Money.franc(10);
      Bank bank = Bank();
      bank.addRate("CHF", "USD", 2);
      Money result = bank.reduce(fiveBucks.plus(tenFrancs), "USD");
      expect(Money.dollar(10).equals(result), true);
    },
  );
}
