import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NormalCard extends StatefulWidget {
  NormalCard({
    super.key,
    required this.changingNumber,
    required this.startingTitle,
    required this.unitOfMeasurement,
    required this.plus,
    required this.minus,
  });

  int changingNumber;
  final String startingTitle;
  final String unitOfMeasurement;
  final Function() plus;
  final Function() minus;

  @override
  State<NormalCard> createState() => _NormalCardState();
}

class _NormalCardState extends State<NormalCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kActiveCardColor,
      ),
      //color: Color(0xFF1D1E33),
      margin: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.startingTitle, //CAN NOT CHANGE
              style: kCardTextStyle,
            ),
            Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.changingNumber.toString(),
                    style: kMeasureNumberStyle),
                Text(widget.unitOfMeasurement.toString(),
                    style: kUnitStyle), //CAN CHANGE
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                    iconData: FontAwesomeIcons.minus, onPress: widget.minus),
                const SizedBox(
                  width: 20,
                ),
                RoundIconButton(
                  iconData: FontAwesomeIcons.plus,
                  onPress: widget.plus,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
