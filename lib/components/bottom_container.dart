import 'package:flutter/material.dart';
import '../constants.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key, required this.textButton,
  });

  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(bottom: 20),
      height: kBottomContainerHeight,
      color: kBottomContainerColor,
      child: Center(
          child: Text(
            textButton,
            style: kBottomContainerTextStyle,
          ),),
    );
  }
}