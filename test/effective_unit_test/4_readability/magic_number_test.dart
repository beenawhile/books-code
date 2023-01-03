import 'dart:math' as math;

import 'package:test/test.dart';

double _calculateBmi({required double weight, required double height}) =>
    double.parse((weight / (math.pow(height, 2))).toStringAsFixed(2));
void main() {
  // before
  test(
    "Middle-School student should return a proper age",
    () async {
      final student = Student("Ken", 1.8, 80.0);
      expect(student.bmi, 24.69);
    },
  );

  // after

  test(
    "Middle-School student should return a proper age",
    () async {
      final student1 = StudentWithNamedParams.withImperial(
        name: "Ken",
        feet: 5,
        inches: 10.866,
        lb: 176.3699536147,
      );
      final student2 = StudentWithNamedParams.withMetric(
        name: "Ken",
        meter: 1.8,
        kg: 80.0,
      );

      expect(
        student1.bmi,
        _calculateBmi(height: student1.height, weight: student1.weight),
      );
      expect(
        student2.bmi,
        _calculateBmi(height: student2.height, weight: student2.weight),
      );
    },
  );
}

class StudentWithNamedParams {
  final String name;
  final double height;
  final double weight;

  const StudentWithNamedParams._({
    required this.name,
    required this.height,
    required this.weight,
  });
  factory StudentWithNamedParams.withMetric({
    required String name,
    required double meter,
    required double kg,
  }) =>
      StudentWithNamedParams._(
        name: name,
        height: meter,
        weight: kg,
      );

  factory StudentWithNamedParams.withImperial({
    required String name,
    required double feet,
    required double inches,
    required double lb,
  }) =>
      StudentWithNamedParams._(
        name: name,
        height: 0.0254 * inches + 0.3048 * feet,
        weight: 0.453592 * lb,
      );

  double get bmi =>
      double.parse((weight / (math.pow(height, 2))).toStringAsFixed(2));
}

class Student {
  final String name;
  final double heightMeter;
  final double weightKg;

  const Student(this.name, this.heightMeter, this.weightKg);

  double get bmi =>
      double.parse((weightKg / (math.pow(heightMeter, 2))).toStringAsFixed(2));
}
