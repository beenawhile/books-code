class _AccountBefore {
  _AccountBefore(this.daysOverdrawn, this._type);

  final int daysOverdrawn;
  final _AccountTypeBefore _type;

  double bankCharge() {
    double result = 4.5;
    if (daysOverdrawn > 0) result += overdraftCharge();
    return result;
  }

  double overdraftCharge() {
    if (_type.isPremium) {
      int bankCharge = 10;
      if (daysOverdrawn <= 7) {
        return bankCharge.toDouble();
      } else {
        return bankCharge * (daysOverdrawn - 7) * 0.85;
      }
    } else {
      return daysOverdrawn * 1.75;
    }
  }
}

class _AccountTypeBefore {
  _AccountTypeBefore(this.isPremium);
  bool isPremium;
}

// Account의 overdraftCharge를 응집성 있게 AccountType으로 이동시키고 싶다

class _AccountAfter {
  _AccountAfter(this.daysOverdrawn, this._type);

  final int daysOverdrawn;
  final _AccountTypeAfter _type;

  double bankCharge() {
    double result = 4.5;
    if (daysOverdrawn > 0) result += _type.overdraftCharge(daysOverdrawn);
    return result;
  }
}

class _AccountTypeAfter {
  _AccountTypeAfter(this.isPremium);
  bool isPremium;

  double overdraftCharge(int daysOverdrawn) {
    if (isPremium) {
      int bankCharge = 10;
      if (daysOverdrawn <= 7) {
        return bankCharge.toDouble();
      } else {
        return bankCharge * (daysOverdrawn - 7) * 0.85;
      }
    } else {
      return daysOverdrawn * 1.75;
    }
  }
}
