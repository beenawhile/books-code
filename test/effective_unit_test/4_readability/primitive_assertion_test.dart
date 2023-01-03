import 'package:test/test.dart';

void main() {
  // assertion is too primitive to reveal intention
  test(
    "Output should have line numbers",
    () async {
      final content = "1st match on #1\nand\n2nd match on #3";
      final output = RegExp(r'match').allMatches(content);
      for (final matchWord in output) {
        expect(matchWord.start != -1, true);
      }
    },
  );

  // refined version(more space to improve)
  test(
    "Output should have line numbers",
    () async {
      final content = "1st match on #1\nand\n2nd match on #3";
      final output = RegExp(r'match').allMatches(content);
      for (final matchWord in output) {
        expect(matchWord.start, isNot(-1));
      }
    },
  );
  test(
    "Output should have line numbers",
    () async {
      final content = "1st match on #1\nand\n2nd match on #3";
      final output = RegExp(r'match').allMatches(content);
      expect(output.length, isNot(0));
    },
  );
}
