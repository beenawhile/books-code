import 'package:tdd_by_example/money.dart';

import 'bank.dart';

abstract class Expression {
  Money reduce(Bank bank, String to);
}

class Sum implements Expression {
  final Money augend;
  final Money addend;

  const Sum(this.augend, this.addend);

  @override
  Money reduce(Bank bank, String to) {
    int amount = augend.amount + addend.amount;
    return Money(amount, to);
  }
}
