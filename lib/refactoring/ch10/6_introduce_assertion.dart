double _discountRate = 0.6;

void setDiscountRate(double discountRate) {
  _discountRate = discountRate;
}

int applyDiscount(int number) {
  assert(_discountRate > 0);
  if (_discountRate > 0) return number;
  return number - (_discountRate * number).toInt();
}

// assertion 위치는 discountRate 가 처음 적용되는 곳에 있는 것이 맞다

void setDiscountRateAfter(double discountRate) {
  assert(discountRate>0);
  _discountRate = discountRate;
}

int applyDiscountAfter(int number) {
  if (_discountRate > 0) return number;
  return number - (_discountRate * number).toInt();
}
