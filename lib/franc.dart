import 'package:tdd_by_example/money.dart';

class Franc extends Money {
  Franc(int amount) : super(amount: amount);

  Franc times(int multiplier) {
    return Franc(amount * multiplier);
  }
}
