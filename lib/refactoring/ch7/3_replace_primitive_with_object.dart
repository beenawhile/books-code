class _OrderBefore {
  const _OrderBefore(this.priority);
  final String priority;
}

class _OrderAfter {
  _OrderAfter(String value) : _priority = _Priority(value);

  _Priority _priority;

  String get priority => _priority.value;

  set priority(String arg) => _priority = _Priority(arg);
}

class _Priority {
  const _Priority(this.value);

  final String value;
}
