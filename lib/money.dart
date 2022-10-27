class Money {
  int amount;
  Money({
    required this.amount,
  });

  bool equals(Object other) {
    return (other is Money && other.amount == amount);
  }
}
