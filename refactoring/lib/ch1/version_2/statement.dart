import 'index.dart';

class Statement {
  String statement(Invoice invoice, Plays plays) {
    final statementData = StatementData(invoice, plays);
    return _renderPlainText(statementData, plays);
  }

  String _renderPlainText(
      StatementData statementData, Plays plays) {
    String result = 'Statement for ${statementData.customer}\n';
    for (final performance in statementData.performances) {
      result +=
          '\t${statementData.playFor(performance)?.name}: \$${(statementData.amountFor(performance) / 100).floor()} (${performance.audience} seats)\n';
    }
    result +=
        'Amount owed is \$${statementData.totalAmount()}\nYou earned ${statementData.totalVolumeCredits()} credits';
    return result;
  }
}
