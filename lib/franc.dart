import 'package:tdd_by_example/money.dart';

class Franc extends Money {
  Franc(super.amount);

  @override
  Franc times(int multiplier) {
    return Franc(amount * multiplier);
  }
}
