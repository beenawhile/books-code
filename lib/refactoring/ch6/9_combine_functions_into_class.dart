import 'dart:math' as math;

void _before1() {
  final reading = _acquireReading();
  final baseCharge = _baseRate(reading.month, reading.year) * reading.quantity;
}

void _before2() {
  final reading = _acquireReading();
  final base = (_baseRate(reading.month, reading.year) * reading.quantity);
  final taxableCharge = math.max(0, base - _taxThreshold(reading.year));
}
// 계산 공식이 공통으로 발생
// 이런 경우 클래스를 하나 만들고 그곳으로 공통 작업을 하는 메소드를 옮긴다

_Reading _acquireReading() {
  return _Reading(1, 1, 1);
}

double _baseRate(int month, int year) {
  return (month * year).toDouble();
}

double _taxThreshold(int year) {
  return year.toDouble();
}

class _Reading {
  _Reading(this.year, this.month, this.quantity);

  final int year;
  final int month;
  final int quantity;
}
