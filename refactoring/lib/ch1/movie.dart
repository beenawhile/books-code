class Movie {
  Movie(this._title, this._priceCode);

  static const int regular = 0;
  static const int newRelease = 1;
  static const int childrens = 2;

  String _title;
  int _priceCode;

  int get priceCode => _priceCode;
  String get title => _title;

  set priceCode(int arg) {
    _priceCode = arg;
  }

  set title(String arg) {
    _title = title;
  }
}
