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
}
