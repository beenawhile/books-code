import 'dart:math' as math;

import 'index.dart';

class Province {
  Province(
    this.name,
    this.demand,
    this.price, {
    this.producers = const [],
  }) {
    for (var element in producers) {
        element.province = this;
        totalProduction += element.production;
      }
  }

  final String name;
  final int demand;
  final int price;
  final List<Producer> producers;
  int totalProduction = 0;

  void addProducer(Producer producer) {
    producers.add(producer);
    totalProduction += producer.production;
  }

  int shortFall() {
    return demand - totalProduction;
  }

  int profit() {
    return _demandValue() - demandCost();
  }

  int _demandValue() {
    return _satisfiedDemand() * price;
  }

  int _satisfiedDemand() {
    return math.min(demand, totalProduction);
  }

  int demandCost() {
    int remainDemand = demand;
    int result = 0;

    producers.sort((a, b) => a.cost.compareTo(b.cost));

    for (final p in producers) {
      int contribution = math.min(remainDemand, p.production);
      remainDemand -= contribution;
      result += contribution * p.cost;
    }

    return result;
  }
}
