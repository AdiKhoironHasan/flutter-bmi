import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({
    Key? key,
    required this.bmi,
  }) : super(key: key);
  final double bmi;

  // String determineBmiCategory(double bmiValue) {
  //   String category = "";
  //   if (bmiValue < 16.0) {
  //     category = underweightSevere;
  //   } else if (bmiValue < 17.0) {
  //     category = underweightModerate;
  //   } else if (bmiValue < 18.5) {
  //     category = underweightMild;
  //   } else if (bmiValue < 25) {
  //     category = normal;
  //   } else if (bmiValue < 30) {
  //     category = overweight;
  //   } else if (bmiValue < 35) {
  //     category = obeseI;
  //   } else if (bmiValue < 40) {
  //     category = obeseII;
  //   } else if (bmiValue >= 40) {
  //     category = obeseIII;
  //   }

  //   return category;
  // }

  // String getHealthRiskDescription(String categoryName) {
  //   String desc = "";
  //   switch (categoryName) {
  //     case underweightSevere:
  //     case underweightModerate:
  //     case underweightMild:
  //       desc = "Possible nutritional deficiency and osteoporosis.";
  //       break;
  //     case normal:
  //       desc = "Low Risk (healthy range).";
  //       break;
  //     case overweight:
  //       desc =
  //           "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
  //       break;
  //     case obeseI:
  //     case obeseII:
  //     case obeseIII:
  //       desc =
  //           "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
  //       break;

  //     default:
  //   }
  //   return desc;
  // }

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    bmiCalculator.determineBmiCategory();
    bmiCalculator.getHealthRiskDescription();

    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Result",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BmiCard(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          bmiCalculator.bmiCategory ?? "",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          bmi.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          bmiCalculator.bmiDescription!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 70,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffec3c66),
              ),
              child: const Center(
                  child: Text(
                "Re-Calculate BMI",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
