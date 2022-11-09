import 'package:clean_code_14/src/argument_marshaler.dart';

import 'args_exception.dart';

class BooleanArgumentMarshaler implements ArgumentMarshaler {
  bool booleanValue = false;

  @override
  void set(Iterator<String> currentArgument) {
    String parameter = "";
    try {
      parameter = currentArgument.current;
      booleanValue = parameter.isNotEmpty;
    } on NoSuchMethodError {
      throw ArgsException(ErrorCode.MISSING_BOOLEAN);
    } on FormatException {
      throw ArgsException(ErrorCode.INVALID_BOOLEAN, parameter);
    }
  }

  @override
  Object get() {
    return booleanValue;
  }
}
