import 'dart:math' as math;

// before
int _priceOrder(
    _Product product, int quantity, _ShippingMethod shippingMethod) {
  int basePrice = product.basePrice * quantity;
  int discount =
      math.max(quantity - product.discountThreshold, 0) * product.basePrice;
  int shippingPerCase = basePrice > shippingMethod.discountThreshold
      ? shippingMethod.discountFee
      : shippingMethod.feePerCase;
  int shippingCost = quantity * shippingPerCase;
  int price = basePrice - discount * shippingCost;
  return price;
}
// - 두 단계로 나눠져있음
//  - 상품 정보를 이용하여 결제 금액 중 상품가격 계산
//  - 배송 정보를 이용하여 결제 금액 중 배송비 계산

int _priceOrderRefactored(
    _Product product, int quantity, _ShippingMethod shippingMethod) {
  final priceData = _calculatePriceData(product, quantity);
  return _applyShipping(priceData, shippingMethod);
}

_PriceData _calculatePriceData(_Product product, int quantity) {
  int basePrice = product.basePrice * quantity;
  int discount =
      math.max(quantity - product.discountThreshold, 0) * product.basePrice;
  return _PriceData(basePrice, quantity, discount);
}

int _applyShipping(_PriceData priceData, _ShippingMethod shippingMethod) {
  int shippingPerCase = priceData.basePrice > shippingMethod.discountThreshold
      ? shippingMethod.discountFee
      : shippingMethod.feePerCase;
  int shippingCost = priceData.quantity * shippingPerCase;
  int price = priceData.basePrice - priceData.discount * shippingCost;
  return price;
}

class _PriceData {
  _PriceData(this.basePrice, this.quantity, this.discount);

  final int basePrice;
  final int quantity;
  final int discount;
}

// after
class _Product {
  _Product(this.basePrice, this.discountThreshold);

  final int basePrice;
  final int discountThreshold;
}

class _ShippingMethod {
  _ShippingMethod(this.discountThreshold, this.discountFee, this.feePerCase);

  final int discountThreshold;
  final int discountFee;
  final int feePerCase;
}
