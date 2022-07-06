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
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "BMI Calculator",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              // fontFamily: "Nunito",
            ),
          ),
        ),
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
                      borderColor: (gender == "male")
                          ? const Color(0xffFFFFFF)
                          : const Color(0xff92B4EC),
                      child: const GenderIconText(
                        icon: Icons.man,
                        title: "B o y",
                      ),
                      bgColor: const Color(0xff92B4EC),
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
                      borderColor: (gender == "female"
                          ? const Color(0xffFFFFFF)
                          : const Color(0xffC1A7F7)),
                      child: const GenderIconText(
                        icon: Icons.woman,
                        title: 'G i r l',
                      ),
                      bgColor: const Color(0xffC1A7F7),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: BmiCard(
                bgColor: const Color(0xffff9282),
                borderColor: const Color(0xffff9282),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "H e i g h t",
                      style: labelTextStyle!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
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
                      activeColor: const Color(0xff97C4B8),
                      thumbColor: const Color(0xff66BFBF),
                      inactiveColor: const Color(0xffCCF3EE),
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
                  bgColor: const Color(0xffB6D986),
                  borderColor: const Color(0xffB6D986),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "W e i g h t",
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
                            fillColor: buttonColor,
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
                              if (weight > 1) {
                                weight--;
                              }
                              setState(() {});
                            },
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: buttonColor,
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
                  bgColor: const Color(0xff9FD3CB),
                  borderColor: const Color(0xff9FD3CB),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "A g e",
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
                            fillColor: buttonColor,
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
                              if (age > 1) {
                                age--;
                              }
                              setState(() {});
                            },
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: buttonColor,
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
                color: const Color(0xffF25287),
              ),
              child: Center(
                  child: Text(
                "Calculate",
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
    this.bgColor = const Color(0xffC1A7F7),
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        // const Color(0xff1d1e33),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor!, width: 5), //tidak null
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
