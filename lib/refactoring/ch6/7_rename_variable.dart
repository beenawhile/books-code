// before
void method() {
  String cpNm = "Strawberry Inc.";
}

// after
void method2() {
  String companyName = "Strawberry Inc.";
  String cpNm = companyName;
  // cpNm으로 되어 있는 것 찾아서 수정
}
