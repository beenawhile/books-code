import 'money.dart';

/// $5 + 10 CHF = $10 if rate is 2:1<br/>
/// ~$5 * 2 = $10~<br/>
/// ~Make "amount" private~<br/>
/// ~Dollar side-effects?~<br/>
/// Money Rounding?<br/>
/// ~equals()~<br/>
/// hashCode<br/>
/// Equal null<br/>
/// Equal object<br/>
/// ~5 CHF * 2 = 10 CHF~<br/>
/// Dolllar/Franc duplication<br/>
/// ~Common equals~<br/>
/// Common times<br/>
/// Compare Francs with Dollars<br/>
class Dollar extends Money {
  Dollar(int amount) : super(amount: amount);

  Dollar times(int multiplier) {
    return Dollar(amount * multiplier);
  }
}
