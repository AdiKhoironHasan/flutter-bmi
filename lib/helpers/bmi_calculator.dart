import 'dart:math';

import 'package:bmi/contants/constant.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.height, required this.weight});

  BmiCalculator.fromBmiValue(this.bmi) {}

  double calculateBmi() {
    double heightInMeter = height! / 100;
    bmi = weight! / (pow(heightInMeter, 2));

    return bmi!;
  }

  String determineBmiCategory() {
    bmiCategory = "";
    if (bmi! < 16.0) {
      bmiCategory = underweightSevere;
    } else if (bmi! < 17.0) {
      bmiCategory = underweightModerate;
    } else if (bmi! < 18.5) {
      bmiCategory = underweightMild;
    } else if (bmi! < 25) {
      bmiCategory = normal;
    } else if (bmi! < 30) {
      bmiCategory = overweight;
    } else if (bmi! < 35) {
      bmiCategory = obeseI;
    } else if (bmi! < 40) {
      bmiCategory = obeseII;
    } else if (bmi! >= 40) {
      bmiCategory = obeseIII;
    }

    return bmiCategory!;
  }

  String getHealthRiskDescription() {
    bmiDescription = "";
    switch (bmiCategory) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        bmiDescription = "Possible nutritional deficiency and osteoporosis.";
        break;
      case normal:
        bmiDescription = "Low Risk (healthy range).";
        break;
      case overweight:
        bmiDescription =
            "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        bmiDescription =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;

      default:
    }
    return bmiDescription!;
  }
}
