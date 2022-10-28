import 'package:tdd_by_example/dollar.dart';
import 'package:tdd_by_example/franc.dart';

class Money {
  final int amount;
  final String currency;
  Money(this.amount, this.currency);

  static Money dollar(int amount) {
    return Dollar(amount, "USD");
  }

  static Money franc(int amount) {
    return Franc(amount, "CHF");
  }

  bool equals(Object other) {
    return (other is Money &&
        other.amount == amount &&
        other.currency == currency);
  }

  Money times(int multiplier) {
    return Money(amount * multiplier, currency);
  }
}
