import 'package:books_code/effective_unit_test/3_test_doubles/exposing_hidden_information.dart';
import 'package:test/test.dart';

void main() {
  test(
    "Engine should be run after car starts",
    () {
      final engine = TestEngine();
      final car = Car(engine);

      car.start();

      expect(engine.isRunning, true);
    },
  );
}

class TestEngine implements Engine {
  bool _isRunning = false;

  bool get isRunning => _isRunning;

  @override
  void start() {
    _isRunning = true;
  }
}
