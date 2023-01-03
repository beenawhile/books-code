import 'argument_marshaler.dart';

import 'args_exception.dart';

class DoubleArgumentMarshaler implements ArgumentMarshaler {
  double doubleValue = 0;

  @override
  void set(Iterator<String> currentArgument) {
    String parameter = "";
    try {
      parameter = currentArgument.current;
      doubleValue = double.parse(parameter);
    } on NoSuchMethodError {
      throw ArgsException(ErrorCode.MISSING_DOUBLE);
    } on FormatException {
      throw ArgsException(ErrorCode.INVALID_DOUBLE, parameter);
    }
  }

  @override
  Object get() {
    return doubleValue;
  }
}
