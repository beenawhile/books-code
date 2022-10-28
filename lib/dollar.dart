import 'money.dart';

class Dollar extends Money {
  Dollar(super.amount, super.currency);

  @override
  Money times(int multiplier) {
    return Money.dollar(amount * multiplier);
  }
}
