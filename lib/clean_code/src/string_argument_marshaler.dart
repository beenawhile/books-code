import 'argument_marshaler.dart';

import 'args_exception.dart';

class StringArgumentMarshaler implements ArgumentMarshaler {
  String stringValue = "";

  @override
  void set(Iterator<String> currentArgument) {
    try {
      stringValue = currentArgument.current;
    } on NoSuchMethodError {
      throw ArgsException(ErrorCode.MISSING_STRING);
    }
  }

  @override
  Object get() {
    return stringValue;
  }
}
