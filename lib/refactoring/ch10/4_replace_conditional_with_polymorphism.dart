String _plumageBefore(_BirdBefore bird) {
  switch (bird.type) {
    case "유럽 제비":
      return "보통이다.";
    case "아프리카 제비":
      return bird.numberOfCoconuts > 2 ? "지쳤다." : "보통이다.";
    case "노르웨이 파랑 앵무":
      return bird.voltage > 100 ? "그을렸다." : "예쁘다";
    default:
      return "알 수 없다.";
  }
}

int _airSpeedVelocityBefore(_BirdBefore bird) {
  switch (bird.type) {
    case "유럽 제비":
      return 35;
    case "아프리카 제비":
      return 40 - 2 * bird.numberOfCoconuts;
    case "노르웨이 파랑 앵무":
      return bird.isNailed ? 0 : 10 + bird.voltage ~/ 10;
    default:
      return 0;
  }
}

class _BirdBefore {
  _BirdBefore(
    this.type,
    this.numberOfCoconuts,
    this.voltage,
    this.isNailed,
  );

  final String type;
  final int numberOfCoconuts;
  final int voltage;
  final bool isNailed;
}

// ----

String _plumageAfter(_Bird bird) {
  return bird.plumage();
}

int _airSpeedVelocityAfter(_Bird bird) {
  return bird.airSpeedVelocity();
}

abstract class _Bird {
  _Bird(this.numberOfCoconuts, this.voltage, this.isNailed);

  final int numberOfCoconuts;
  final int voltage;
  final bool isNailed;

  String get type;

  String plumage() => "알수 없다.";

  int airSpeedVelocity() => 0;
}

class _EuropeanSwallow extends _Bird {
  _EuropeanSwallow(
    super.numberOfCoconuts,
    super.voltage,
    super.isNailed,
  );

  @override
  String get type => "유럽 제비";

  @override
  String plumage() {
    return "보통이다.";
  }

  @override
  int airSpeedVelocity() {
    return 35;
  }
}

class _AfricanSwallow extends _Bird {
  _AfricanSwallow(
    super.numberOfCoconuts,
    super.voltage,
    super.isNailed,
  );

  @override
  String get type => "아프리카 제비";

  @override
  String plumage() {
    return numberOfCoconuts > 2 ? "지쳤다" : "보통이다.";
  }

  @override
  int airSpeedVelocity() {
    return 40 - 2 * numberOfCoconuts;
  }
}

class _NorwegianBlueParrot extends _Bird {
  _NorwegianBlueParrot(
    super.numberOfCoconuts,
    super.voltage,
    super.isNailed,
  );

  @override
  String get type => "노르웨이 앵무";

  @override
  String plumage() {
    return voltage > 100 ? "게을렀다" : "예쁘다";
  }

  @override
  int airSpeedVelocity() {
    return isNailed ? 0 : 10 + voltage ~/ 10;
  }
}
