/// $5 + 10 CHF = $10 if rate is 2:1<br/>
/// ~$5 * 2 = $10~<br/>
/// Make "amount" private<br/>
/// ~Dollar side-effects?~<br/>
/// Money Rounding?<br/>
/// ~equals()~<br/>
/// hashCode<br/>
/// Equal null
/// Equal object
class Dollar {
  Dollar(this.amount);

  int amount = 0;

  Dollar times(int multiplier) {
    return Dollar(amount * multiplier);
  }

  bool equals(Object other) {
    return (other is Dollar && other.amount == amount);
  }
}
