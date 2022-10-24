import 'package:tdd_by_example/dollar.dart';
import 'package:test/test.dart';

void main() {
  group(
    "Dollar",
    () {
      test(
        "times() should do right multiplication",
        () async {
          final five = Dollar(5);
          expect(Dollar(10).equals(five.times(2)), true);
          expect(Dollar(15).equals(five.times(3)), true);
        },
      );

      test(
        "equals() should evaluate values right with same amount",
        () async {
          final dollar = Dollar(5);
          expect(dollar.equals(Dollar(5)), true);
          expect(dollar.equals(Dollar(6)), false);
        },
      );
    },
  );
}
