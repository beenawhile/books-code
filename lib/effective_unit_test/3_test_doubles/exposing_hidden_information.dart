class Car {
  const Car(this.engine);

  final Engine engine;

  void start() {
    engine.start();
  }
}

abstract class Engine {
  void start();
}
