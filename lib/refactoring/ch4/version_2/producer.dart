import 'index.dart';

class Producer {

  Producer(this.name,this.cost,this._production, [this.province]);

  final String name;
  final int cost;
  int _production;
  Province? province;

  int get production => _production;

  set production(int arg) {
    province?.totalProduction += arg - _production;
    _production = arg;
  }
}
