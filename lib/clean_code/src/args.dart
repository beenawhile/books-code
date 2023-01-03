import 'string_argument_marshaler.dart';

import 'args_exception.dart';
import 'argument_marshaler.dart';
import 'boolean_argument_marshaler.dart';
import 'double_argument_marshaler.dart';
import 'integer_argument_marshaler.dart';

class Args {
  String schema;
  final marshalers = <String, ArgumentMarshaler>{};
  final argsFound = <String>{};
  late Iterator<String> currentArgument;
  late List<String> argsList;

  Args(this.schema, List<String> args) {
    argsList = args;
    print(args);
    _parse();
  }

  void _parse() {
    _parseSchema();
    _parseArguments();
  }

  bool _parseSchema() {
    for (final element in schema.split(",")) {
      if (element.isNotEmpty) {
        _parseSchemaElement(element.trim());
      }
    }
    return true;
  }

  void _parseSchemaElement(String element) {
    final elementId = element[0];
    String elementTail = element.substring(1);
    _validateSchemaElementId(elementId);
    if (elementTail.isEmpty) {
      marshalers[elementId] = BooleanArgumentMarshaler();
    } else if (elementTail == "*") {
      marshalers[elementId] = StringArgumentMarshaler();
    } else if (elementTail == "#") {
      marshalers[elementId] = IntegerArgumentMarshaler();
    } else if (elementTail == "##") {
      marshalers[elementId] = DoubleArgumentMarshaler();
    } else {
      throw ArgsException(ErrorCode.INVALID_FORMAT, elementId, elementTail);
    }
  }

  void _validateSchemaElementId(String elementId) {
    if (isNumeric(elementId)) {
      throw ArgsException(ErrorCode.INVALID_ARGUMENT_NAME, elementId, "");
    }
  }

  bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  void _parseArguments() {
    while (currentArgument.moveNext()) {
      String arg = currentArgument.current;
      _parseArgument(arg);
    }
  }

  void _parseArgument(String arg) {
    if (arg.startsWith("-")) {
      _parseElements(arg);
    }
  }

  void _parseElements(String arg) {
    for (var i = 1; i < arg.length; i++) {
      _parseElement(arg[i]);
    }
  }

  void _parseElement(String argChar) {
    if (_setArgument(argChar)) {
      argsFound.add(argChar);
    } else {
      throw ArgsException(ErrorCode.UNEXPECTED_ARGUMENT, argChar, "");
    }
  }

  bool _setArgument(String argChar) {
    final m = marshalers[argChar];
    if (m == null) {
      return false;
    }
    try {
      m.set(currentArgument);
      return true;
    } on ArgsException catch (e) {
      e.setErrorArgumentId(argChar);
      rethrow;
    }
  }

  int cardinality() {
    return argsFound.length;
  }

  String usage() {
    if (schema.isNotEmpty) {
      return "-[$schema]";
    } else {
      return "";
    }
  }

  bool getBoolean(String arg) {
    final am = marshalers[arg];
    bool b = false;
    try {
      b = am != null && am.get() as bool;
    } on TypeError {
      b = false;
    }
    return b;
  }

  String getString(String arg) {
    final am = marshalers[arg];
    try {
      return am == null ? "" : am.get() as String;
    } on Exception {
      return "";
    }
  }

  int getInt(String arg) {
    final am = marshalers[arg];
    try {
      return am == null ? 0 : am.get() as int;
    } on Exception {
      return 0;
    }
  }

  double getDouble(String arg) {
    final am = marshalers[arg];
    try {
      return am == null ? 0 : am.get() as double;
    } on Exception {
      return 0.0;
    }
  }

  bool has(String arg) {
    return argsFound.contains(arg);
  }
}
