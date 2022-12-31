import 'package:refactoring/ch1/customer.dart';
import 'package:refactoring/ch1/movie.dart';
import 'package:refactoring/ch1/rental.dart';
import 'package:test/test.dart';

void main() {
  final movie1 = Movie("The Hulk", Movie.childrens);
  final movie2 = Movie("Iron Man", Movie.newRelease);
  final movie3 = Movie("Spiderman", Movie.regular);

  const fred = "Fred";
  final customer = Customer(fred);

  String expectedMessageFor(
      String rental, double price, double total, int renterPointsEarned) {
    return "Rental record for $fred\n\t$rental\t$price\nAmount owed is $total\nYou earned $renterPointsEarned frequent renter points";
  }

  tearDown(
    () {
      customer.clearRentals();
    },
  );

  test(
    'basic children rental',
    () {
      customer.addRental(Rental(movie1, 2));
      expect(customer.statement(), expectedMessageFor("The Hulk", 1.5, 1.5, 1));
    },
  );

  test(
    'should not discount newRelease rental but bonus frequentRenter points',
    () {
      customer.addRental(Rental(movie1, 4));
      expect(customer.statement(), expectedMessageFor("The Hulk", 3.0, 3.0, 1));
    },
  );

  test(
    'basic newRelease rental',
    () {
      customer.addRental(Rental(movie2, 1));
      expect(customer.statement(), expectedMessageFor("Iron Man", 3.0, 3.0, 1));
    },
  );

  test(
    'should not discount newRelease rental but bonus frequentRenter points',
    () {
      customer.addRental(Rental(movie2, 4));
      expect(
          customer.statement(), expectedMessageFor("Iron Man", 12.0, 12.0, 2));
    },
  );

  test(
    'basic regular rental',
    () {
      customer.addRental(Rental(movie3, 1));
      expect(
          customer.statement(), expectedMessageFor("Spiderman", 2.0, 2.0, 1));
    },
  );

  test(
    'should not discount regular rental',
    () {
      customer.addRental(Rental(movie3, 4));
      expect(
          customer.statement(), expectedMessageFor("Spiderman", 5.0, 5.0, 1));
    },
  );

  test(
    'should sum various rentals',
    () {
      customer.addRental(Rental(movie1, 2));
      customer.addRental(Rental(movie3, 1));
      customer.addRental(Rental(movie2, 3));

      expect(customer.statement(),
          "Rental record for $fred\n\tThe Hulk\t1.5\n\tSpiderman\t2.0\n\tIron Man\t9.0\nAmount owed is 12.5\nYou earned 4 frequent renter points");
    },
  );
}
