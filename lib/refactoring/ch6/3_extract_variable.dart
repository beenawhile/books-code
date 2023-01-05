import 'dart:math' as math;

class _Before {
  double price(_Order order) {
    return order.quantity * order.itemPrice -
        math.max(0, order.quantity - 500) * order.itemPrice * 0.05 +
        math.min(order.quantity * order.itemPrice * 0.1, 100);
  }
}

class _After {
  double price(_Order order) {
    final basePrice = order.quantity * order.itemPrice;
    final quantityDiscount =
        math.max(0, order.quantity - 500) * order.itemPrice * 0.05;
    final shipping = math.min(order.quantity * order.itemPrice * 0.1, 100);
    return basePrice - quantityDiscount + shipping;
  }
}

// 클래스에 적용하는 사례
class _Order {
  const _Order(this.quantity, this.itemPrice);

  final int quantity;
  final int itemPrice;

  double price() {
    return quantity * itemPrice -
        math.max(0, quantity - 500) * itemPrice * 0.05 +
        math.min(quantity * itemPrice * 0.1, 100);
  }
}

class _OrderAfter {
  const _OrderAfter(this.quantity, this.itemPrice);

  final int quantity;
  final int itemPrice;

  double price() {
    return _basePrice - _quantityDiscount + _shipping;
  }

  int get _basePrice => quantity * itemPrice;

  double get _quantityDiscount =>
      math.max(0, quantity - 500) * itemPrice * 0.05;

  double get _shipping => math.min(quantity * itemPrice * 0.1, 100);
}
