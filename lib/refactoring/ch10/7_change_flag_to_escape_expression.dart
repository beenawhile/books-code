void _before(List<_Person> people) {
  bool found = false;

  for (final p in people) {
    if (!found) {
      if (p.name == "조거") {
        _sendAlert();
        found = true;
      }
      if (p.name == "사루만") {
        _sendAlert();
        found = true;
      }
    }
  }
}

void _sendAlert() {}

class _Person {
  const _Person(this.name);

  final String name;
}

void _after(List<_Person> people) {
  bool found = false;

  for (final p in people) {
    if (!found) {
      if (p.name == "조거") {
        _sendAlert();
        return;
      }
      if (p.name == "사루만") {
        _sendAlert();
        return;
      }
    }
  }
}
