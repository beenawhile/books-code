class _ProductionPlanBefore1 {
  _ProductionPlanBefore1(this.production);

  int production;
  List<_Adjustment> adjustments = [];

  int getProduction() {
    return production;
  }

  void applyAdjustment(_Adjustment adjustment) {
    adjustments.add(adjustment);
    production += adjustment.amount;
  }
}

class _Adjustment {
  _Adjustment(this.amount);

  final int amount;
}

// problem: duplicated data(production)

class _ProductionPlanAfter1 {
  _ProductionPlanAfter1();

  final List<_Adjustment> adjustments = [];

  int getProduction() {
    return adjustments.fold(
      0,
      (result, adjustment) => result += adjustment.amount,
    );
  }

  void applyAdjustment(_Adjustment adjustment) {
    adjustments.add(adjustment);
  }
}

// example 2
class _ProductionPlanBefore2 {
  late int production;
  late final List<_Adjustment> adjustments;

  _ProductionPlanBefore2(int production) {
    this.production = production;
    adjustments = [];
  }

  int getProduction() {
    return production;
  }

  void applyAdjustment(_Adjustment adjustment) {
    adjustments.add(adjustment);
    production += adjustment.amount;
  }
}

class _ProductionPlanAfter2 {
  late int initialProduction;
  late final List<_Adjustment> adjustments;

  _ProductionPlanAfter2(int production) {
    initialProduction = production;
    adjustments = [];
  }

  int getProduction() {
    return initialProduction + calculateProductionAccumulate();
  }

  int calculateProductionAccumulate() {
    return adjustments.fold(
      0,
      (previousValue, element) => previousValue += element.amount,
    );
  }

  void applyAdjustment(_Adjustment adjustment) {
    adjustments.add(adjustment);
  }
}
