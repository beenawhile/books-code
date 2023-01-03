import 'package:clean_code_14/src/argument_marshaler.dart';

import 'args_exception.dart';

class IntegerArgumentMarshaler implements ArgumentMarshaler {
  int intValue = 0;

  @override
  void set(Iterator<String> currentArgument) {
    String parameter = "";
    try {
      parameter = currentArgument.current;
      intValue = int.parse(parameter);
    } on NoSuchMethodError {
      throw ArgsException(ErrorCode.MISSING_INTEGER);
    } on FormatException {
      throw ArgsException(ErrorCode.INVALID_INTEGER, parameter);
    }
  }

  @override
  Object get() {
    return intValue;
  }
}
