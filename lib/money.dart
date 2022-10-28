class Money {
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
}
