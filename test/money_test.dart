import 'package:tdd_by_example/dollar.dart';
import 'package:tdd_by_example/franc.dart';
import 'package:test/test.dart';

void main() {
  test(
    "Classes derived from Money should be equal",
    () async {
      expect(Dollar(5).equals(Franc(5)), true);
    },
  );
}
