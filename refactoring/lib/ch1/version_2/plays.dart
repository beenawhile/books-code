import 'index.dart';

class Plays {
  Plays([Map<String, Play>? playMap]) : _playMap = playMap ?? {};

  final Map<String, Play> _playMap;

  Play? getPlay(Performance performance) => _playMap[performance.playId];
}
