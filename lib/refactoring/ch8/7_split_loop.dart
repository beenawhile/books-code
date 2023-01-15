class _Before {
  _Before(this.peopleList);

  final List<_People> peopleList;

  void call() {
    int youngest =
        peopleList.isEmpty ? double.maxFinite.toInt() : peopleList[0].age;
    int totalSalary = 0;
    for (_People p in peopleList) {
      if (p.age < youngest) {
        youngest = p.age;
      }
      totalSalary += p.salary;
    }
  }
}

class _People {
  _People(this.age, this.salary);

  final int age;
  final int salary;
}


class _After {
  _After(this.peopleList);

  final List<_People> peopleList;

  void call() {
    int youngest =
        peopleList.isEmpty ? double.maxFinite.toInt() : peopleList[0].age;
    int totalSalary = 0;
    for (_People p in peopleList) {
      if (p.age < youngest) {
        youngest = p.age;
      }
    }

    for (_People p in peopleList) {
      totalSalary += p.salary;
    }
  }
}
