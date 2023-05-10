import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import '../components/gender_card.dart';
import '../components/gender_details.dart';
import '../components/normal_card.dart';
import '../components/height_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../components/bottom_container.dart';

enum Gender { male, female }

class Inputpage extends StatefulWidget {
  const Inputpage({Key? key}) : super(key: key);
  @override
  State<Inputpage> createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  Gender? selectedGender;
  int height = 200;
  int weight = 90;
  int age = 18;

  void _onGenderCardPressed(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void _updateHeight(double newHeight) {
    setState(() {
      height = newHeight.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBGColor,
      appBar: AppBar(
        title: kAppBarTitle,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: GenderCard(
                    onPress: () {
                      _onGenderCardPressed(Gender.male);
                    },
                    color1: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderDetails(
                      x: selectedGender == Gender.male ? 1 : 0,
                      genderIcon: FontAwesomeIcons.mars,
                      genderName: "Male",
                    ),
                    key: UniqueKey(),
                  ),
                ),
                Expanded(
                  child: GenderCard(
                    onPress: () => _onGenderCardPressed(Gender.female),
                    // Without the function we can type:
                    // onPress: () {
                    //   setState(() {
                    //     selectedGender = Gender.female;
                    //   });
                    // },
                    color1: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderDetails(
                      x: selectedGender == Gender.female ? 1 : 0,
                      genderIcon: FontAwesomeIcons.venus,
                      genderName: "Female",
                    ),
                    key: UniqueKey(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: HeightCard(
              onChange: _updateHeight,
              height: height,
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: NormalCard(
                    minus: () => setState(() {
                      weight--;
                    }),
                    plus: () => setState(() {
                      weight++;
                    }),
                    changingNumber: weight,
                    startingTitle: "WEIGHT",
                    unitOfMeasurement: " KG",
                  ),
                ),
                Expanded(
                  child: NormalCard(
                    minus: () => setState(() {
                      age--;
                    }),
                    plus: () => setState(() {
                      age++;
                    }),
                    changingNumber: age,
                    startingTitle: "AGE",
                    unitOfMeasurement: " Yrs",
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                CalculatorBrain brain =
                    CalculatorBrain(height: height, weight: weight);
                // brain.getInterpretation();
                // brain.getResult();
                // brain.calculateBMI();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: brain.calculateBMI(),
                      resultText: brain.getResult(),
                      interpretation: brain.getInterpretation(),
                    ),
                  ),
                );
              },
              child: const BottomContainer(
                textButton: "CALCULATE",
              )),
        ],
      ),
    );
  }
}
