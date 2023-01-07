class _PersonBefore {
  _PersonBefore(this.name, this.department);

  final String name;
  _DepartmentBefore department;
}

class _DepartmentBefore {
  _DepartmentBefore(this.chargeCode, this.manager);

  int chargeCode;
  _PersonBefore manager;
}

// - 클라이언트가 어떤 사람이 속한 부서의 관리자를 알고 싶다면
//  `person.department.manager` 처럼 찾아가야 해 의존성이 발생한다
// - 사람 클래스에 간단히 위임 메소드를 만들면 된다

class _PersonAfter {
  const _PersonAfter(this.name, this._department);

  final String name;
  final _DepartmentAfter _department;

  _PersonAfter manager() {
    return _department.getManager();
  }
}

class _DepartmentAfter {
  _DepartmentAfter(this.chargeCode, this.manager);

  int chargeCode;
  _PersonAfter manager;

  _PersonAfter getManager() => manager;
}
