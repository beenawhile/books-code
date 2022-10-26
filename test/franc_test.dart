import 'package:tdd_by_example/franc.dart';
import 'package:test/test.dart';

void main() {
  test(
    "Franc should calculate times",
    () async {
      final franc = Franc(5);
      expect(Franc(10).equals(franc.times(2)), true);
      expect(Franc(15).equals(franc.times(3)), true);
    },
  );
}
