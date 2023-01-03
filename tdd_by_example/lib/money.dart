import 'package:tdd_by_example_part_1/bank.dart';
import 'package:tdd_by_example_part_1/expression.dart';

class Money implements Expression {
  final int amount;
  final String currency;

  const Money(this.amount, this.currency);

  factory Money.dollar(int amount) => Money(amount, "USD");
  factory Money.franc(int amount) => Money(amount, "CHF");

  @override
  bool operator ==(Object other) {
    return (other is Money &&
        other.amount == amount &&
        other.currency == currency);
  }

  @override
  int get hashCode => amount;

  @override
  Expression times(int multiplier) {
    return Money(amount * multiplier, currency);
  }

  @override
  Expression plus(Expression addend) {
    return Sum(this, addend);
  }

  @override
  Money reduce(Bank bank, String to) {
    int rate = bank.rate(currency, to);
    return Money(amount ~/ rate, to);
  }
}
