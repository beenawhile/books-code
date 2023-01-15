class _CustomerBefore {
  String name;
  double discountRate;
  late _CustomerContractBefore customerContract;

  _CustomerBefore(this.name, this.discountRate) {
    customerContract = _CustomerContractBefore(DateTime.now());
  }

  double getDiscountRate() {
    return discountRate;
  }

  void becomePreferred() {
    discountRate += 0.3;
    // do something
  }

  int applyAmount(int amount) {
    return amount - (amount * discountRate).toInt();
  }
}

class _CustomerContractBefore {
  _CustomerContractBefore(this.time);
  final DateTime time;
}

// discountRate를 CustomerContract로 이동 시키려고 한다

class _CustomerAfter {

  String name;
  late _CustomerContractAfter customerContract;

  _CustomerAfter(this.name, double discountRate) {
    customerContract = _CustomerContractAfter(DateTime.now(), discountRate);
  }

  void becomePreferred() {
    customerContract.setDiscountRate(customerContract.discountRate + 0.3);
    // do something
  }

  int applyAmount(int amount) {
    return amount - (amount * customerContract.discountRate).toInt();
  }
}

class _CustomerContractAfter {
  _CustomerContractAfter(this.time,this._discountRate);

  final DateTime time;
  double _discountRate;

  double get discountRate => _discountRate;

  void setDiscountRate(double arg) => _discountRate = arg;
}
