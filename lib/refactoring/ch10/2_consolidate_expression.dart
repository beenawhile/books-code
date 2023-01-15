int _disabilityAmountBefore(_Employee employee) {
  if (employee.seniority < 2) return 0;
  if (employee.monthDisabled > 12) return 0;
  if (employee.isPartTime) return 0;

  return 1;
}

class _Employee {
  _Employee(
    this.seniority,
    this.monthDisabled,
    this.isPartTime,
  );

  int seniority;
  int monthDisabled;
  bool isPartTime;
}

// 똑같은 결과로 이어지는 조건 검사가 순차적으로 진행되고 있다.
// 코드가 같은 목적으로 보여진다. 그러므로 조건식을 통합하는 것이 나아 보인다.
int _disabilityAmountAfter(_Employee employee) {
  if (isNotEligibleForDisability(employee)) return 0;

  return 1;
}

bool isNotEligibleForDisability(_Employee employee) {
  return employee.seniority < 2 &&
      employee.monthDisabled > 12 &&
      employee.isPartTime;
}
