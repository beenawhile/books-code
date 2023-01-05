import 'dart:math' as math;

// simple procedure
// - change name
//   - before
double _circum(double radius) {
  return 2 * math.pi * radius;
}

//   - after
double _circumference(double radius) {
  return 2 * math.pi * radius;
}

// migration procedure
// - change name
//   - before
double _circumm(double radius) {
  return 2 * math.pi * radius;
}

//   - after
double _circum2(double radius) {
  return _circumference2(radius);
}

double _circumference2(double radius) {
  return 2 * math.pi * radius;
}
// 테스트 한 후 정상적으로 돌아가면 기존의 함수를 인라인하고 새로운 함수로 변경

// - add parameter
//   - before
class _Before {
  const _Before(this.reservations);
  final List<_Customer> reservations;

  void addReservation(_Customer customer) {
    reservations.add(customer);
  }
}

//   - after
class _After {
  const _After(this.reservations);
  final List<_Customer> reservations;

  void addReservation(_Customer customer) {
    _priorityAddReservation(customer, false);
  }

  void _priorityAddReservation(_Customer customer, bool isPriority) {
    reservations.add(customer);
  }
}
// 테스트 한 후 정상적으로 돌아가면 기존의 함수를 인라인

class _Customer {}
