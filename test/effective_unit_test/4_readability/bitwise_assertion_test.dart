import 'dart:io' show Platform;

import 'package:test/test.dart';

void main() {
  // before: bitwise operation is good, but too abstract
  test(
    "Platform should be Windows or macOS",
    () async {
      expect(Platform.isWindows ^ Platform.isMacOS, true);
    },
  );
  // after
  test(
    "Platform should be Windows or macOS",
    () async {
      expect(Platform.isWindows || Platform.isMacOS, true);
      expect(Platform.isWindows && Platform.isMacOS, false);
    },
  );
}
