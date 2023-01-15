List<_Office> _acquireDataBefore(String input) {
  final lines = input.split("\n");
  bool firstLine = true;
  final List<_Office> result = [];
  for (String line in lines) {
    if (firstLine) {
      firstLine = false;
      continue;
    }
    if (line.trim() == "") continue;

    final record = line.split(",");
    if (record[1].trim() == "India") {
      result.add(_Office(record[0], record[2]));
    }
  }
  return result;
}

class _Office {
  const _Office(this.name, this.location);

  final String name;
  final String location;
}

List<_Office> _acquireDataAfter(String input) {
  final lines = input.split("\n");
  final List<_Office> result = [];

  lines
      .skip(1)
      .where(
        (line) => !(line.trim() == ""),
      )
      .map(
        (line) => line.split(","),
      )
      .where(
        (elementrecord) => elementrecord[1].trim() == "India",
      )
      .forEach((record) => result.add(_Office(record[0], record[1])));

  return result;
}
