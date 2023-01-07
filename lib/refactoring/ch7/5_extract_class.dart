class _PersonBefore {
  _PersonBefore(this.name, this.officeAreaCode, this.officeNumber);

  String name;
  String officeAreaCode;
  String officeNumber;
}

class _PersonAfter {
  _PersonAfter(this.name, String officeAreaCode, String officeNumber)
      : telephoneNumber = _TelephoneNumber(officeNumber, officeAreaCode);

  String name;
  _TelephoneNumber telephoneNumber;
}

class _TelephoneNumber {
  _TelephoneNumber(this.officeNumber, this.officeAreaCode);

  String officeNumber;
  String officeAreaCode;
}
