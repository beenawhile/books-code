class _Before {
  void method(_BeforeMoney money) {
    final dollar = money.amount;
    print(dollar);
  }
}

class _BeforeMoney {
  _BeforeMoney(this.amount);
  int amount;
}

class _After {
  void method(_AfterMoney money) {
    final dollar = money.dollar;
    print(dollar);
  }
}

class _AfterMoney {
  _AfterMoney(this._amount);
  final int _amount;
  final double rate = 1.2;

  double get dollar => rate * _amount;
}
