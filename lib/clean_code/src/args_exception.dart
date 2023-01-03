class ArgsException implements Exception {
  String errorArgumentId;
  String errorParameter;
  ErrorCode errorCode;

  ArgsException(
      [this.errorCode = ErrorCode.OK,
      this.errorParameter = "TILT",
      this.errorArgumentId = "\0"]);

  String getErrorArgumentId() {
    return errorArgumentId;
  }

  void setErrorArgumentId(String errorArgumentId) {
    this.errorArgumentId = errorArgumentId;
  }

  String getErrorParameter() {
    return errorParameter;
  }

  void setErrorParameter(String errorParameter) {
    this.errorParameter = errorParameter;
  }

  ErrorCode getErrorCode() {
    return errorCode;
  }

  void setErrorCode(ErrorCode errorCode) {
    this.errorCode = errorCode;
  }

  String errorMessage() {
    switch (errorCode) {
      case ErrorCode.OK:
        throw Exception("TILT: Should not get here.");
      case ErrorCode.UNEXPECTED_ARGUMENT:
        return "Argument -$errorArgumentId unexpected.";
      case ErrorCode.MISSING_STRING:
        return "Could not find string parameter for -$errorArgumentId.";
      case ErrorCode.INVALID_INTEGER:
        return "Argument -$errorArgumentId expects an integer but was '$errorParameter'.";
      case ErrorCode.MISSING_INTEGER:
        return "Could not find integer parameter for -%$errorArgumentId.";
      case ErrorCode.INVALID_DOUBLE:
        return "Argument -$errorArgumentId expects a double but was '$errorParameter'.";
      case ErrorCode.MISSING_DOUBLE:
        return "Could not find double parameter for -$errorArgumentId.";
      default:
        return "";
    }
  }
}

enum ErrorCode {
  OK,
  INVALID_FORMAT,
  UNEXPECTED_ARGUMENT,
  INVALID_ARGUMENT_NAME,
  MISSING_STRING,
  MISSING_INTEGER,
  INVALID_INTEGER,
  MISSING_DOUBLE,
  MISSING_BOOLEAN,
  INVALID_BOOLEAN,
  INVALID_DOUBLE
}
