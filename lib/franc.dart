import 'package:tdd_by_example/money.dart';

class Franc extends Money {
  Franc(super.amount, super.currency);

  @override
  Money times(int multiplier) {
    return Money.franc(amount * multiplier);
  }
}
