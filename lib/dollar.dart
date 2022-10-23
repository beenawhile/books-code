class Dollar {
  Dollar(int amount) {
    _amount = amount;
  }

  int _amount = 0;

  int get amount => _amount;

  void times(int multiplier) {
    _amount *= multiplier;
  }
}
