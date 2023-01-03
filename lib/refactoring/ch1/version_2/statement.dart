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
    result += 'Amount owed is \$${statementData.totalAmount()}\n';
    result += 'You earned ${statementData.totalVolumeCredits()} credits';
    return result;
  }

  String _renderHtml(StatementData statementData) {
    String result = '<h1>Statement for ${statementData.customer}</h1>\n';
    result += '<table>\n';
    result += '<tr><th>play</th><th>seats</th><th>cost</th></tr>';
    for (final performance in statementData.performances) {
      result += ' <tr><td>${statementData.playFor(performance)?.name}</td><td>${performance.audience}</td>';
      result += '<td>${(statementData.amountFor(performance)/100).round()}</td></tr>\n';
    }
    result += "</table>\n";
    result += '<p>Amount owed is <em>\$${statementData.totalAmount()}</em></p>';
    result += '<p>You earned <em>${statementData.totalVolumeCredits()}</em> credits</p>';
    return result;
  }
}
