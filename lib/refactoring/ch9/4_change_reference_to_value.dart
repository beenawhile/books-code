class _PersonBefore {
  late _TelephoneNumber telephoneNumber;

  _PersonBefore() {
    telephoneNumber = _TelephoneNumber("", "");
  }

  String getOfficeAreaCode() {
    return telephoneNumber.areaCode;
  }

  void setOfficeAreaCode(String areaCode) {
    telephoneNumber.setAreaCode(areaCode);
  }

  String getOfficeNumber() {
    return telephoneNumber.number;
  }

  void setOfficeNumber(String number) {
    telephoneNumber.setNumber(number);
  }
}

class _TelephoneNumber {
  _TelephoneNumber(this.areaCode, this.number);
  String areaCode;
  String number;

  void setNumber(String arg) {
    number = arg;
  }

  void setAreaCode(String arg) {
    areaCode = arg;
  }
}

// TelephoneNumber에 있어야할 메소드들이 Person에 있다는 것이 문제
class _PersonAfter {
  late _TelephoneNumberAfter telephoneNumber;

  _PersonAfter() {
    telephoneNumber = _TelephoneNumberAfter("", "");
  }

  String getOfficeAreaCode() {
    return telephoneNumber.areaCode;
  }

  void setOfficeAreaCode(String areaCode) {
    telephoneNumber = _TelephoneNumberAfter(
      areaCode,
      telephoneNumber.number,
    );
  }

  String getOfficeNumber() {
    return telephoneNumber.number;
  }

  void setOfficeNumber(String number) {
    telephoneNumber = _TelephoneNumberAfter(
      telephoneNumber.areaCode,
      number,
    );
  }
}

class _TelephoneNumberAfter {
  const _TelephoneNumberAfter(this.areaCode, this.number);

  final String areaCode;
  final String number;
}
