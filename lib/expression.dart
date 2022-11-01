import 'package:tdd_by_example/money.dart';

import 'bank.dart';

abstract class Expression {
  Money reduce(Bank bank, String to);
  Expression plus(Expression addend);
  Expression times(int multiplier);
}

class Sum implements Expression {
  final Expression augend;
  final Expression addend;

  const Sum(this.augend, this.addend);

  @override
  Money reduce(Bank bank, String to) {
    int amount =
        augend.reduce(bank, to).amount + addend.reduce(bank, to).amount;
    return Money(amount, to);
  }

  @override
  Expression plus(Expression addend) {
    return Sum(this, addend);
  }

  @override
  Expression times(int multiplier) {
    return Sum(augend.times(multiplier), addend.times(multiplier));
  }
}
