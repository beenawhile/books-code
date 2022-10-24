import 'package:tdd_by_example/dollar.dart';
import 'package:test/test.dart';

void main() {
  group(
    "Dollar",
    () {
      test(
        "times() should not affect original amount",
        () async {
          final dollar = Dollar(5);
          Dollar product = dollar.times(2);
          expect(10, product.amount);
          product = dollar.times(3);
          expect(15, product.amount);
        },
      );

      test(
        "equals() should evaluate values right with same amount",
        () async {
          final dollar = Dollar(5);
          expect(dollar.equals(Dollar(5)), true);
          expect(dollar.equals(6), false);
        },
      );
    },
  );
}
