import 'package:refactoring/ch1/movie.dart';
import 'package:refactoring/ch1/rental.dart';

class Customer {
  Customer(this._name);

  final String _name;
  final List<Rental> _rentals = [];

  String get name => _name;

  void addRental(Rental arg) {
    _rentals.add(arg);
  }

  void clearRental() {
    _rentals.clear();
  }

  String statement() {
    double totalAmount = 0;
    int frequentRenterPoints = 0;
    String result = "Rental record for $name\n";
    for (final each in _rentals) {
      double thisAmount = 0;
      //determine amounts for each line
      switch (each.movie.priceCode) {
        case Movie.regular:
          thisAmount +=2;
          if (each.daysRented >2) {
            thisAmount+=(each.daysRented-2) * 1.5;
          }
          break;
        case Movie.newRelease:
          thisAmount+=each.daysRented *3;
          break;
        case Movie.childrens:
          thisAmount += 1.5;
          if (each.daysRented >3) {
            thisAmount += (each.daysRented-3) * 1.5;
          }
          break;
      }

      // add frequent renter points
      frequentRenterPoints+=1;
      // add bonus for a two day new release rental
      if (each.movie.priceCode == Movie.newRelease && each.daysRented > 1) {
        frequentRenterPoints+=1;
      }

      // show figures for this rental
      result += "\t${each.movie.title}\t$thisAmount\n";
      totalAmount += thisAmount;
    }

    // add footer lines
    result += "Amount owed is $totalAmount\n";
    result += "You earned $frequentRenterPoints frequent renter points";
    return result;
  }
}
