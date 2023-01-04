import 'index.dart';

class ProvinceFactory {
  const ProvinceFactory._();

  static Province getSampleProvince() {
    final List<Producer> producers = [];
    Producer byzantinum = Producer("Byzantinum", 10, 9);
    Producer attalia = Producer("Attalia", 12, 10);
    Producer sinope = Producer("Sinope", 10, 6);

    producers.add(byzantinum);
    producers.add(attalia);
    producers.add(sinope);

    return Province("Asia", 30, 20, producers: producers);
  }
}
