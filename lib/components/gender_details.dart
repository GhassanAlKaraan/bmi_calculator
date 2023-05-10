import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class GenderDetails extends StatefulWidget {
  const GenderDetails(
      {super.key,
      required this.x,
      required this.genderIcon,
      required this.genderName});
  final int x; // NEW
  final IconData genderIcon;
  final String genderName;

  // NEW
  Color updateTextColor() {
    if (x == 0) {
      return kGenderTextColor;
    } else {
      return kSelectedTextColor;
    }
  }

  @override
  State<GenderDetails> createState() => _GenderDetailsState();
}

class _GenderDetailsState extends State<GenderDetails> {
  @override
  Widget build(BuildContext context) {
    Color textColor = widget.updateTextColor();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(widget.genderIcon, size: 90, color: Colors.white),
        SizedBox(
          child: Text(
            widget.genderName,
            style: TextStyle(fontSize: 22, color: textColor),
          ),
        )
      ],
    );
  }
}
