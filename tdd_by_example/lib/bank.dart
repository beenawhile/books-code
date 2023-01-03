import 'package:tdd_by_example_part_1/expression.dart';
import 'package:tdd_by_example_part_1/money.dart';

class Bank {
  final _rates = <_Pair, int>{};

  Money reduce(Expression source, String to) {
    return source.reduce(this, to);
  }

  void addRate(String from, String to, int rate) {
    _rates[_Pair(from, to)] = rate;
  }

  int rate(String from, String to) {
    if (from == to) return 1;
    final rate = _rates[_Pair(from, to)];
    return rate ?? 1;
  }
}

class _Pair {
  final String from;
  final String to;

  const _Pair(this.from, this.to);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _Pair && other.from == from && other.to == to;
  }

  @override
  int get hashCode => from.hashCode ^ to.hashCode;
}
