class _Before {
  void printOwing(_Invoice invoice) {
    int outstanding = 0;

    print("*****************");
    print("**** 고객 채무 ****");
    print("*****************");

    // 미해결 채무 (outstanding) 을 계산한다.
    for (final o in invoice.orders) {
      outstanding += o.amount;
    }

    // 마감일(dueDate) 을 기록한다.
    final today = DateTime.now();
    invoice.dueDate = today.add(Duration(days: 30));

    // 세부 사항을 출력한다.
    print("고객명: ${invoice.customer}");
    print("채무액: $outstanding");
    print("마감일: ${invoice.dueDate}");
  }
}

class _After {
  void printOwing(_Invoice invoice) {
    _printBanner();

    _recordDueDate(invoice);

    _printDetails(invoice);
  }

  void _printBanner() {
    print("*****************");
    print("**** 고객 채무 ****");
    print("*****************");
  }

  void _recordDueDate(_Invoice invoice) {
    final today = DateTime.now();
    invoice.dueDate = today.add(Duration(days: 30));
  }

  void _printDetails(_Invoice invoice) {
    print("고객명: ${invoice.customer}");
    print("채무액: ${_calculateOutstanding(invoice)}");
    print("마감일: ${invoice.dueDate}");
  }

  int _calculateOutstanding(_Invoice invoice) {
    int result = 0;
    for (final o in invoice.orders) {
      result += o.amount;
    }
    return result;
  }
}

class _Invoice {
  _Invoice(this.dueDate, this.customer, this.orders);
  DateTime dueDate;
  final String customer;
  final List<_Order> orders;
}

class _Order {
  const _Order(this.amount);
  final int amount;
}
