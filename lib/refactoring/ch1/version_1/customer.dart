import 'index.dart';

class Customer {
  Customer(this._name);

  final String _name;
  final List<Rental> _rentals = [];

  String get name => _name;

  void addRental(Rental arg) {
    _rentals.add(arg);
  }

  void clearRentals() {
    _rentals.clear();
  }

  String statement() {
    String result = "Rental record for $name\n";
    for (final each in _rentals) {
      // show figures for this rental
      result += "\t${each.movie.title}\t${each.getCharge()}\n";
    }

    // add footer lines
    result += "Amount owed is ${_getTotalCharge()}\n";
    result +=
        "You earned ${_getTotalFrenquentRenterPoints()} frequent renter points";
    return result;
  }

  double _getTotalCharge() {
    double result = 0;

    for (final each in _rentals) {
      result += each.getCharge();
    }

    return result;
  }

  int _getTotalFrenquentRenterPoints() {
    int result = 0;

    for (final each in _rentals) {
      result += each.getFrequentRenterPoints();
    }

    return result;
  }

  String htmlStatement() {
    String result = '<H1>Rentals for <EM>$name</EM></H1><P>\n';
    for (var each in _rentals) {
      // show figures for each rental
      result += '${each.movie.title}: ${each.getCharge()}<BR>\n';
    }
    // add footer lines
    result += '<P>You owe <EM> $_getTotalCharge()</EM><P>\n';
    result +=
        'On this rental you earned <EM>$_getTotalFrenquentRenterPoints()</EM>frequent renter points<P>';

    return result;
  }
}
