class _Before {
  List<_Reading> readingsOutsideRange(_Station station, int min, int max) {
    return station.readings.where((r) => r.temp < min || r.temp > max).toList();
  }
}

class _After {
  List<_Reading> readingsOutsideRange(
      _Station station, _NumberRange numberRange) {
    return station.readings
        .where((r) => r.temp < numberRange.min || r.temp > numberRange.max)
        .toList();
  }
}

class _NumberRange {
  const _NumberRange(this.min, this.max);
  final int min;
  final int max;
}

class _Station {
  const _Station(this.readings);
  final List<_Reading> readings;
}

class _Reading {
  const _Reading(this.temp);
  final int temp;
}
