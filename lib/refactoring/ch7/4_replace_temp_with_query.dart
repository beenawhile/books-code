class _OrderBefore {
  const _OrderBefore(this.quantity, this.item);

  final int quantity;
  final _Item item;

  double getPrice() {
    final basePrice = quantity * item.price;
    double discountFactor = 0.98;
    if (basePrice > 1000) discountFactor -= 0.03;
    return basePrice * discountFactor;
  }
}

class _OrderAfter {
  const _OrderAfter(this.quantity, this.item);

  final int quantity;
  final _Item item;

  double get price => basePrice * discountFactor;

  int get basePrice => quantity * item.price;

  double get discountFactor {
    double result = 0.98;
    if (basePrice > 1000) result -= 0.03;
    return result;
  }
}

class _Item {
  int price = 1;
}
