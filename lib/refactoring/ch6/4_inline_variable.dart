class _Before {
  bool method(_Order order) {
    final basePrice = order.basePrice;
    return basePrice > 1000;
  }
}

class _After {
  bool method(_Order order) {
    return order.basePrice > 1000;
  }
}

class _Order {
  const _Order(this.basePrice);
  final int basePrice;
}
