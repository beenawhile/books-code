import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void _addTo(List<dynamic> space, List<dynamic> values) {
  for (final value in values) {
    space.add(value);
  }
}

void _assertContainsExactly(List space, List values) {
  final length = space.length;
  for (var i = 0; i < values.length; i++) {
    dynamic spaceObject;
    for (final value in values) {
      if (space.contains(value)) {
        spaceObject = value;
        space.remove(spaceObject);
        break;
      }
    }
    expect(values.contains(spaceObject), true);
  }
  expect(space.length, length - values.length);
}

void main() {
  // before: too much details
  test(
    "test object space",
    () async {
      final List<Object> objectSpace = [];
      final o1 = 10;
      final o2 = 20;
      final o3 = 30;
      final o4 = "hello";

      objectSpace.add(o1);
      objectSpace.add(o2);
      objectSpace.add(o3);
      objectSpace.add(o4);

      final storedFixnums = List<int>.filled(3, 0);
      storedFixnums[0] = o1;
      storedFixnums[1] = o2;
      storedFixnums[2] = o3;

      expect(objectSpace.removeLast(), o4);
      expect(objectSpace.length, 3);

      for (var i = 0; i < 3; i++) {
        final popItem = objectSpace.removeAt(0);
        expect(storedFixnums.contains(popItem), true);
      }
      expect(objectSpace.length, 0);
    },
  );

  // after
  late List<Object> space;
  late String string;
  late List<int> fixnums;

  setUp(
    () {
      space = [];
      string = "hello";
      fixnums = [10, 20, 30];
    },
  );

  test(
    "space should have values",
    () async {
      _addTo(space, [string]);
      _addTo(space, fixnums);

      _assertContainsExactly(space, [string]);
      _assertContainsExactly(space, fixnums);
    },
  );
}
