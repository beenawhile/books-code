import 'package:books_code/refactoring/ch1/version_2/index.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Statement should match expected String',
    () {
      // arrange
      final statement = Statement();
      final performances = <Performance>[];
      performances.add(Performance("hamlet", 55));
      performances.add(Performance("as-like", 35));
      performances.add(Performance("othello", 40));

      final invoice = Invoice("BigCo", performances);

      final playMap = <String, Play>{};
      playMap['hamlet'] = Play("Hamlet", PlayType.tragedy);
      playMap['as-like'] = Play("As You Like It", PlayType.comedy);
      playMap['othello'] = Play('Othello', PlayType.tragedy);
      final plays = Plays(playMap);

      final answer =
          'Statement for BigCo\n\tHamlet: \$650 (55 seats)\n\tAs You Like It: \$580 (35 seats)\n\tOthello: \$500 (40 seats)\nAmount owed is \$1730\nYou earned 47 credits';

      // act
      final result = statement.statement(invoice, plays);

      // assert
      expect(result, answer);
    },
  );
}
