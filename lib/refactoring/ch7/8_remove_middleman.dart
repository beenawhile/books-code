class _PersonBefore {
  const _PersonBefore(this.name, this._department);

  final String name;
  final _DepartmentBefore _department;

  _PersonBefore manager() {
    return _department.getManager();
  }
}

class _DepartmentBefore {
  _DepartmentBefore(this.chargeCode, this.manager);

  int chargeCode;
  _PersonBefore manager;

  _PersonBefore getManager() => manager;
}

class _PersonAfter {
  _PersonAfter(this.name, this.department);

  final String name;
  _DepartmentAfter department;
}

class _DepartmentAfter {
  _DepartmentAfter(this.chargeCode, this.manager);

  int chargeCode;
  _PersonAfter manager;
}
