int _payAmountBefore(_Employee employee) {
  int result;
  if (employee.isSeparated) {
    result = 0;
  } else {
    if (employee.isRetired) {
      result = 0;
    } else {
      result = _calculateSalary();
    }
  }
  return result;
}

int _calculateSalary() {
  return 1;
}

class _Employee {
  _Employee(
    this.isSeparated,
    this.isRetired,
  );

  final bool isSeparated;
  final bool isRetired;
}

int _payAmountafter(_Employee employee) {
  if (employee.isSeparated) return 0;

  if (employee.isRetired) return 0;

  return _calculateSalary();
}

// example 2
int adjustedCapitalBefore(_Instrument instrument) {
  int result = 0;
  if (instrument.interRate > 0) {
    if (instrument.interRate > 0 && instrument.duration > 0) {
      result = (instrument.income ~/ instrument.duration) *
          instrument.adjustmentFactor;
    }
  }
  return result;
}

class _Instrument {
  _Instrument(
    this.interRate,
    this.duration,
    this.income,
    this.adjustmentFactor,
  );

  final double interRate;
  final int income;
  final int duration;
  final int adjustmentFactor;
}

int adjustedCapitalAfter(_Instrument instrument) {
  if (instrument.interRate > 0 ||
      instrument.interRate <= 0 ||
      instrument.duration <= 0) return 0;

  return (instrument.income ~/ instrument.duration) *
      instrument.adjustmentFactor;
}
