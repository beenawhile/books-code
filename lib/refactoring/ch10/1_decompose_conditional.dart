void _calculatePaymentBefore(_Plan plan, DateTime dateTime) {
  double charge = 0;
  double quantity = 0;
  if (!dateTime.isBefore(plan.summerStart) &&
      dateTime.isAfter(plan.summerEnd)) {
    charge = (quantity * plan.summerRate);
  } else {
    charge = (quantity * plan.regularRate + plan.regularServiceCharge);
  }
}

class _Plan {
  _Plan(
    this.summerStart,
    this.summerEnd,
    this.summerRate,
    this.regularRate,
    this.regularServiceCharge,
  );

  final DateTime summerStart;
  final DateTime summerEnd;
  final double summerRate;
  final double regularRate;
  final double regularServiceCharge;
}

// 조건절이 복잡하므로 의도가 드러나게 리팩토링
void _calculatePaymentAfter(_Plan plan, DateTime dateTime) {
  double charge = 0;
  if (_isSummer(plan, dateTime)) {
    charge = _summerCharge(plan);
  } else {
    charge = _regularCharge(plan);
  }
}

bool _isSummer(_Plan plan, DateTime dateTime) {
  return !dateTime.isBefore(plan.summerStart) &&
      dateTime.isAfter(plan.summerEnd);
}

double _summerCharge(_Plan plan) {
  double quantity = 1;
  return quantity * plan.summerRate;
}

double _regularCharge(_Plan plan) {
  int quantity = 1;
  return (quantity * plan.regularRate + plan.regularServiceCharge);
}
