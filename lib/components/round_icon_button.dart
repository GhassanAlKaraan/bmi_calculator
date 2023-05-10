import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.iconData, required this.onPress}) : super(key: key);

  final IconData iconData;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      // CTRL + Q to see documentation
      onPressed: onPress,
      elevation: 6,
      disabledElevation: 6, //if there is no onPressed
      constraints: const BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      shape: const CircleBorder(), //ShapeBorder Class
      fillColor: const Color(0xFF4C4F5E), // CTRL + Q to see documentation
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}
