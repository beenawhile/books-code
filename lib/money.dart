import 'package:tdd_by_example/dollar.dart';
import 'package:tdd_by_example/franc.dart';

abstract class Money {
  int amount;
  Money(this.amount);

  static Money dollar(int amount) {
    return Dollar(amount);
  }

  static Money franc(int amount) {
    return Franc(amount);
  }

  bool equals(Object other) {
    return (other is Money && other.amount == amount);
  }

  Money times(int multiplier);
}
