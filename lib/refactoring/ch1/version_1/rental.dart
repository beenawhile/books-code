import 'index.dart';

class Rental {
  const Rental(this._movie, this._daysRented);

  final Movie _movie;
  final int _daysRented;

  Movie get movie => _movie;
  int get daysRented => _daysRented;


  double getCharge() {
    return _movie.getCharge(daysRented);
  }

  int getFrequentRenterPoints() {
    return _movie.getFrequentRentalPoints(daysRented);
  }
}
