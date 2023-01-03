import 'performance_calculator.dart';

import 'index.dart';

class StatementData {
  StatementData(this._invoice, this._plays) {
    calculatorFactory = PerformanceCalculatorFactory();
  }

  final Invoice _invoice;
  final Plays _plays;
  late final PerformanceCalculatorFactory calculatorFactory;

  String get customer => _invoice.customer;

  Invoice get invoice => _invoice;

  List<Performance> get performances => _invoice.performances;

  Play? playFor(Performance performance) {
    return _plays.getPlay(performance);
  }

  int totalAmount() {
    int totalAmount = 0;
    for (final performance in _invoice.performances) {
      totalAmount += amountFor(performance);
    }
    return (totalAmount / 100).round();
  }

  int amountFor(Performance performance) {
    return calculatorFactory
        .createPerformanceCalculator(performance, playFor(performance))
        .amountFor();
  }

  int totalVolumeCredits() {
    int volumeCredits = 0;
    for (var performance in _invoice.performances) {
      volumeCredits += volumeCreditFor(performance);
    }
    return volumeCredits;
  }

  int volumeCreditFor(Performance performance) {
    return calculatorFactory
        .createPerformanceCalculator(performance, playFor(performance))
        .volumeCreditFor();
  }
}
