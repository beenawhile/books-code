import 'package:refactoring/ch1/movie.dart';

abstract class Price {
  int get code;

  double getCharge(int daysRented);

  int getFrequentRenterPoints(int daysRented) {
    return 1;
  }
}

class ChildrensPrice extends Price {
  @override
  int get code => Movie.childrens;

  @override
  double getCharge(int daysRented) {
    double result = 1.5;
    if (daysRented > 3) {
      result += (daysRented - 3) * 1.5;
    }
    return result;
  }
}

class NewReleasePrice extends Price {
  @override
  int get code => Movie.newRelease;

  @override
  double getCharge(int daysRented) {
    return daysRented * 3;
  }

  @override
  int getFrequentRenterPoints(int daysRented) {
    return (daysRented > 1) ? 2 : 1;
  }
}

class RegularPrice extends Price {
  @override
  int get code => Movie.regular;

  @override
  double getCharge(int daysRented) {
    double result = 2;
    if (daysRented > 2) {
      result += (daysRented - 2) * 1.5;
    }
    return result;
  }
}
