class _PersonBefore {
  _PersonBefore(this.name);

  String name;
  List<_Course> courses = [];

  String getName() {
    return name;
  }

  List<_Course> getCourses() {
    return courses;
  }

  void setCourses(List<_Course> courses) {
    this.courses = courses;
  }
}

class _PersonAfter {
  _PersonAfter(this.name) : _courses = [];

  final String name;
  final List<_Course> _courses;

  List<_Course> get courses => List.from(_courses);

  void addCourse(_Course course) {
    _courses.add(course);
  }

  void removeCourse(_Course course) {
    _courses.remove(course);
  }

  void removeAt(int index) {
    try {
      _courses.removeAt(index);
    } on Exception {
      rethrow;
    }
  }
}

class _Course {
  _Course(this.name, this.isAdvanced);

  String name;
  bool isAdvanced;
}
