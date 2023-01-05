class _Before {
  int rating(_Driver driver) {
    return _moreThanFiveLateDeliveries(driver) ? 2 : 1;
  }

  bool _moreThanFiveLateDeliveries(_Driver driver) {
    return driver.numberOfLateDeliveries > 5;
  }
}

class _After {
  int rating(_Driver driver) {
    return driver.numberOfLateDeliveries > 5 ? 2 : 1;
  }
}

class _Driver {
  int get numberOfLateDeliveries => 6;
}
