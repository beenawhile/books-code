import 'package:tdd_by_example/dollar.dart';
import 'package:test/test.dart';

void main() {
  test(
    "Dollar multiplication should return right amount",
    () async {
      final dollar = Dollar(5);
      dollar.times(2);
      expect(10, dollar.amount);
    },
  );
}
