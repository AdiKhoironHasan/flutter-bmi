import 'package:bmi/contants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 65;
  int age = 21;
  String? gender;

  // double calculateBmi() {
  //   double heightInMeter = height / 100;
  //   final bmi = weight / (pow(heightInMeter, 2));

  //   return bmi;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "male";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == "male") ? Colors.white : primaryColor,
                      child: const GenderIconText(
                        icon: Icons.male,
                        title: "Male",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "female";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == "female" ? Colors.white : primaryColor),
                      child: const GenderIconText(
                        icon: Icons.female,
                        title: 'Female',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: BmiCard(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: labelTextStyle!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$height",
                      style: numberTextStyle,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "cm",
                      style: labelTextStyle,
                    ),
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 80,
                  max: 250,
                  activeColor: Colors.white,
                  thumbColor: Colors.red,
                  onChanged: (value) {
                    height = value.toInt();
                    setState(() {});
                  },
                )
              ],
            )),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: BmiCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: labelTextStyle,
                      ),
                      Text(
                        "$weight",
                        style: numberTextStyle,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              weight++;
                              // print(weight);
                              setState(() {});
                            },
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: Colors.grey,
                            constraints: const BoxConstraints.tightFor(
                              width: 50,
                              height: 50,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RawMaterialButton(
                            onPressed: () {
                              weight--;
                              setState(() {});
                            },
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: Colors.grey,
                            constraints: const BoxConstraints.tightFor(
                              width: 50,
                              height: 50,
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: BmiCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: labelTextStyle,
                      ),
                      Text(
                        "$age",
                        style: numberTextStyle,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              age++;
                              setState(() {});
                            },
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: Colors.grey,
                            constraints: const BoxConstraints.tightFor(
                              width: 50,
                              height: 50,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RawMaterialButton(
                            onPressed: () {
                              age--;
                              setState(() {});
                            },
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: Colors.grey,
                            constraints: const BoxConstraints.tightFor(
                              width: 50,
                              height: 50,
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
          GestureDetector(
            onTap: () {
              final bmiCalculator =
                  BmiCalculator(height: height, weight: weight);
              bmiCalculator.calculateBmi();
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                // print(calculateBmi());
                return BmiResultScreen(
                  bmi: bmiCalculator.bmi!,
                );
              })));
            },
            child: Container(
              height: 70,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffec3c66),
              ),
              child: Center(
                  child: Text(
                "Calculate BMI",
                style: labelTextStyle!.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1d1e33),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor!), //tidak null
      ),
      margin: const EdgeInsets.all(15),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: labelTextStyle,
        )
      ],
    );
  }
}
