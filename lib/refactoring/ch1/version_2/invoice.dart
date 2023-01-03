import 'index.dart';

class Invoice {
  Invoice(this._customer, [List<Performance>? performances])
      : _performances = performances ?? [];

  final String _customer;
  final List<Performance> _performances;

  String get customer => _customer;
  List<Performance> get performances => _performances;
}
