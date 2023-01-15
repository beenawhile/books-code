import 'dart:math' as math;

class _HaggisBefore {
  double distanceTravelled(_Scenario scenario, int time) {
    double result;
    int acc = scenario.primaryForce ~/ scenario.mass; // 가속도 = 힘 * 질량
    int primaryTime = math.min(time, scenario.delay);
    result = 0.5 * acc * primaryTime * primaryTime; // 전파된 거리
    int secondaryTime = time - scenario.delay;
    if (secondaryTime > 0) {
      // 두 번째 힘을 반영해 다시 계산
      int primaryVelocity = acc * scenario.delay;
      acc = (scenario.primaryForce + scenario.secondaryForce) ~/ scenario.mass;
      result += primaryVelocity * secondaryTime +
          0.5 * acc * secondaryTime * secondaryTime;
    }
    return result;
  }
}

class _Scenario {
  const _Scenario(
    this.mass,
    this.delay,
    this.primaryForce,
    this.secondaryForce,
  );

  final int mass;
  final int delay;
  final int primaryForce;
  final int secondaryForce;
}

class _HaggisAfter {
  double distanceTravelled(_Scenario scenario, int time) {
    double result;
    final primaryAcceleration = scenario.primaryForce ~/ scenario.mass; // 가속도 = 힘 / 질량
    int primaryTime = math.min(time, scenario.delay);
    result = 0.5 * primaryAcceleration * primaryTime * primaryTime; // 전파된 거리
    int secondaryTime = time - scenario.delay;
    if (secondaryTime > 0) {
      // 두 번째 힘을 반영해 다시 계산
      int primaryVelocity = primaryAcceleration * scenario.delay;
      final secondaryAcceleration = (scenario.primaryForce + scenario.secondaryForce) ~/ scenario.mass;
      result += primaryVelocity * secondaryTime +
          0.5 * secondaryAcceleration * secondaryTime * secondaryTime;
    }
    return result;
  }
}

// another example: split parameter
 class _ExampleInputParameterBefore {
     int discount(int inputValue, int quantity) {
        if (inputValue > 50) inputValue -= 2;
        if (quantity > 100) inputValue -= 1;
        return inputValue; 
    }
}

class _ExampleInputParameterAfter {
  int discount(int inputValue, int quantity) {
    int result = inputValue;
    if (inputValue > 50) result -= 2;
    if (quantity > 100) result -= 1;
    return result;
  }
}
