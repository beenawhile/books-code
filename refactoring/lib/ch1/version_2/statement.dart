import 'dart:math' as math;
import 'index.dart';

class Statement {
  String statement(Invoice invoice, Plays plays) {
    String result = 'Statement for ${invoice.customer}\n';
    for (final performance in invoice.performances) {
      result +=
          '\t${_playFor(plays, performance)?.name}: \$${(_amountFor(performance, plays) / 100).floor()} (${performance.audience} seats)\n';
    }

    result +=
        'Amount owed is \$${_totalAmount(invoice, plays)}\nYou earned ${_totalVolumeCredits(invoice, plays)} credits';
    return result;
  }

  int _totalVolumeCredits(Invoice invoice, Plays plays) {
    int volumeCredits = 0;
    for (var performance in invoice.performances) {
      volumeCredits += _volumeCreditFor(plays, performance);
    }
    return volumeCredits;
  }

  int _totalAmount(Invoice invoice, Plays plays) {
    int totalAmount = 0;
    for (final performance in invoice.performances) {
      totalAmount += _amountFor(performance, plays);
    }
    return (totalAmount / 100).round();
  }

  int _amountFor(Performance performance, Plays plays) {
    final play = _playFor(plays, performance);
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

  Play? _playFor(Plays plays, Performance performance) {
    return plays.getPlay(performance);
  }

  int _volumeCreditFor(Plays plays, Performance performance) {
    int volumeCredits = math.max(performance.audience - 30, 0);
    if (_playFor(plays, performance)?.type == PlayType.comedy) {
      volumeCredits += (performance.audience / 5).floor();
    }
    return volumeCredits;
  }
}
