import 'package:tdd_by_example/money.dart';
import 'package:test/test.dart';

void main() {
  test(
    "Franc should calculate times",
    () async {
      final franc = Money.franc(5);
      expect(Money.franc(10).equals(franc.times(2)), true);
      expect(Money.franc(15).equals(franc.times(3)), true);
    },
  );

  test(
    "equals()",
    () async {
      expect(Money.franc(5).equals(Money.franc(5)), true);
      expect(Money.franc(5).equals(Money.franc(6)), false);
    },
  );
}
