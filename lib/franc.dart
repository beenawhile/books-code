class Franc {
  final double _amount;

  Franc([this._amount = 0]);

  Franc times(int multiplier) {
    return Franc(_amount * multiplier);
  }

  bool equals(Object other) {
    return (other is Franc && _amount == other._amount);
  }
}
