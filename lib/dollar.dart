/// $5 + 10 CHF = $10 if rate is 2:1<br/>
/// ~$5 * 2 = $10~<br/>
/// ~Make "amount" private~<br/>
/// ~Dollar side-effects?~<br/>
/// Money Rounding?<br/>
/// ~equals()~<br/>
/// hashCode<br/>
/// Equal null
/// Equal object
class Dollar {
  Dollar([this._amount = 0]);

  final int _amount;

  Dollar times(int multiplier) {
    return Dollar(_amount * multiplier);
  }

  bool equals(Object other) {
    return (other is Dollar && other._amount == _amount);
  }
}
