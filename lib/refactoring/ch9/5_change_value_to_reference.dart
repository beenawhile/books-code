class _OrderBefore {
  _OrderBefore(double customerId, double number) {
    customer = _Customer(customerId);
    number = number;
  }

  late _Customer customer;
  late double number;

  _Customer getCustomer() {
    return customer;
  }
}

class _Customer {
  const _Customer(this.id);

  final double id;
}

// 여기서 하나의 고객이 주문 다섯개를 생성한다면
// 독립된 고객 객체가 다섯 개 만들어진다.
// 이 중 하나를 수정한다 하더라도 네 개는 반영되지 않는다.
// 그리고 고객의 정보를 조금이라도 수정할려면
// 고객 객체 모두 찾아서 수정해야한다.

// 물리적으로 똑같은 고객 객체를 사용하고 싶다면
// 먼저 이 유일한 객체를 저장해둘 곳이 있어야 한다.
class _CustomerRepository {
  Map<double, _Customer> repository = {};

  _Customer registerCustomer(double id) {
    repository.putIfAbsent(id, () => _Customer(id));
    return findCustomer(id);
  }

  _Customer findCustomer(double id) {
    return repository[id]!;
  }
}

class _OrderAfter {
  _OrderAfter(double customerId, this.number) {
    customer = repository.registerCustomer(customerId);
  }

  final repository = _CustomerRepository();
  final double number;
  late _Customer customer;

  _Customer getCustomer() {
    return customer;
  }
}
