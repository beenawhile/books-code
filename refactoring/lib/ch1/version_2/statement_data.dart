import 'dart:math' as math;
import 'index.dart';

class StatementData {
  const StatementData(this._invoice, this._plays);

  final Invoice _invoice;
  final Plays _plays;

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
    final play = playFor(performance);
    int result = 0;
    switch (play?.type) {
      case PlayType.tragedy:
        result = 40000;
        if (performance.audience > 30) {
          result += 1000 * (performance.audience - 30);
        }
        break;
      case PlayType.comedy:
        result = 30000;
        if (performance.audience > 20) {
          result += 10000 + 500 * (performance.audience - 20);
        }
        result += 300 * performance.audience;
        break;
      default:
        throw ArgumentError('unknown type: ${play?.type}');
    }

    return result;
  }

  int totalVolumeCredits() {
    int volumeCredits = 0;
    for (var performance in _invoice.performances) {
      volumeCredits += volumeCreditFor(performance);
    }
    return volumeCredits;
  }

  int volumeCreditFor(Performance performance) {
    int volumeCredits = math.max(performance.audience - 30, 0);
    if (playFor(performance)?.type == PlayType.comedy) {
      volumeCredits += (performance.audience / 5).floor();
    }
    return volumeCredits;
  }
}
