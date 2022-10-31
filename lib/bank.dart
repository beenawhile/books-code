import 'package:tdd_by_example/expression.dart';
import 'package:tdd_by_example/money.dart';

class Bank {
  final rates = <_Pair, int>{};

  Money reduce(Expression source, String to) {
    return source.reduce(this, to);
  }

  int rate(String from, String to) {
    if (from == to) return 1;
    int? rate = rates[_Pair(from, to)];
    return rate ?? 1;
  }

  void addRate(String from, String to, int rate) {
    rates[_Pair(from, to)] = rate;
  }
}

class _Pair {
  final String _from;
  final String _to;

  const _Pair(String from, String to)
      : _from = from,
        _to = to;

  @override
  int get hashCode => _from.hashCode & _to.hashCode;

  @override
  bool operator ==(Object other) {
    return (other is _Pair && _from == other._from && _to == other._to);
  }
}
