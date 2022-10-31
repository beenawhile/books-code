import 'package:tdd_by_example/expression.dart';

class Money implements Expression {
  final int amount;
  final String currency;

  Money(this.amount, this.currency);

  static Money dollar(int amount) {
    return Money(amount, "USD");
  }

  static Money franc(int amount) {
    return Money(amount, "CHF");
  }

  bool equals(Object other) {
    return (other is Money &&
        other.amount == amount &&
        other.currency == currency);
  }

  Money times(int multiplier) {
    return Money(amount * multiplier, currency);
  }

  Expression plus(Money addend) {
    return Money(amount + addend.amount, addend.currency);
  }
}
