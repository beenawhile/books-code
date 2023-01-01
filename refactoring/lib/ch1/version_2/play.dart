import 'index.dart';

class Play {
  const Play(this._name, this._type);

  final String _name;
  final PlayType _type;

  String get name => _name;
  PlayType get type => _type;
}
