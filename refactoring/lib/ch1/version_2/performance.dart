class Performance {
  const Performance(this._playId, this._audience);

  final String _playId;
  final int _audience;

  String get playId => _playId;
  int get audience => _audience;
}
