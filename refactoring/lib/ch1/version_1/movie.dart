
import 'index.dart';

class Movie {
  Movie(this._title, int code) {
    setPriceCode(code);
  }

  static const int regular = 0;
  static const int newRelease = 1;
  static const int childrens = 2;

  final String _title;
  late final Price _price;

  int get priceCode => _price.code;
  String get title => _title;

  void setPriceCode(int arg) {
    switch (arg) {
      case Movie.regular:
        _price = RegularPrice();
        break;
      case Movie.newRelease:
        _price = NewReleasePrice();
        break;
      case Movie.childrens:
        _price = ChildrensPrice();
        break;
      default:
        throw ArgumentError(this);
    }
  }

  double getCharge(int daysRented) {
    return _price.getCharge(daysRented);
  }

  int getFrequentRentalPoints(int daysRented) {
    return _price.getFrequentRenterPoints(daysRented);
  }
}
