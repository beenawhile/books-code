import 'dart:math' as math;

import 'index.dart';

class PerformanceCalculatorFactory {
  PerformanceCalculator createPerformanceCalculator(
      Performance performance, Play? play) {
    switch (play?.type) {
      case PlayType.tragedy:
        return TragedyCalculator(performance, play);
      case PlayType.comedy:
        return ComedyCalculator(performance, play);
      default:
        throw Exception("unknown type");
    }
  }
}

abstract class PerformanceCalculator {
  const PerformanceCalculator(this.performance, this.play);

  final Performance performance;
  final Play? play;

  int amountFor();

  int volumeCreditFor();
}

class ComedyCalculator extends PerformanceCalculator {
  const ComedyCalculator(super.performance, super.play);

  @override
  int volumeCreditFor() {
    return math.max(performance.audience - 30, 0) +
        (performance.audience / 5).floor();
  }

  @override
  int amountFor() {
    int result = 30000;
    if (performance.audience > 20) {
      result += 10000 + 500 * (performance.audience - 20);
    }
    result += 300 * performance.audience;
    return result;
  }
}

class TragedyCalculator extends PerformanceCalculator {
  const TragedyCalculator(super.performance, super.play);

  @override
  int volumeCreditFor() {
    return math.max(performance.audience - 30, 0);
  }

  @override
  int amountFor() {
    int result = 40000;
    if (performance.audience > 30) {
      result += 1000 * (performance.audience - 30);
    }
    return result;
  }
}
