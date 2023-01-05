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

double _calculateBaseCharge(_Reading reading) {
  return (_baseRate(reading.month, reading.year) * reading.quantity);
}
// 계산 공식이 공통으로 발생
// 9와 달리 파생 정보 계산 로직을 모두 하나의 변환 함수에 넣기

// after
_Reading _enrichReading(_Reading reading) {
  final result = reading.clone();
  result.baseCharge = _calculateBaseCharge(result);
  return result;
}

void _after1() {
  final rawReading = _acquireReading();
  final reading = _enrichReading(rawReading);
  double basicChargeAmount = reading.baseCharge;
}

_Reading _acquireReading() {
  return _Reading(1, 1, 1, 1);
}

double _baseRate(int month, int year) {
  return (month * year).toDouble();
}

double _taxThreshold(int year) {
  return year.toDouble();
}

class _Reading {
  _Reading(this.year, this.month, this.quantity, this.baseCharge);

  final int year;
  final int month;
  final int quantity;
  double baseCharge;

  _Reading clone({int? year, int? month, int? quantity, double? baseCharge}) {
    return _Reading(
      year ?? this.year,
      month ?? this.month,
      quantity ?? this.quantity,
      baseCharge ?? this.baseCharge,
    );
  }
}
