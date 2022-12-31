import 'package:refactoring/ch1/movie.dart';

class Rental {
  Rental(this._movie, this._daysRented);

  Movie _movie;
  int _daysRented;

  Movie get movie => _movie;
  int get daysRented => _daysRented;

  set movie(Movie arg) => _movie = arg;
  set daysRented(int arg) => _daysRented = daysRented;

  double getCharge() {
    return _movie.getCharge(daysRented);
  }

  int getFrequentRenterPoints() {
    return _movie.getFrequentRentalPoints(daysRented);
  }
}
