import 'package:tdd_by_example/dollar.dart';
import 'package:tdd_by_example/money.dart';
import 'package:test/test.dart';

void main() {
  group(
    "Dollar",
    () {
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
          final dollar = Money.dollar(5);
          expect(dollar.equals(Money.dollar(5)), true);
          expect(dollar.equals(Money.dollar(6)), false);
        },
      );
    },
  );
}
