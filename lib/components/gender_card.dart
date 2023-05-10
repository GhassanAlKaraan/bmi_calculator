import 'package:flutter/material.dart';

class GenderCard extends StatefulWidget {
  const GenderCard(
      {super.key,
      required this.color1,
      required this.cardChild,
      required this.onPress});

  final Color color1;
  final Widget cardChild;
  final Function() onPress;

  @override
  State<GenderCard> createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //color: const Color(0xFF1D1E33),
          color: widget.color1,
        ),
        //color: Color(0xFF1D1E33),
        margin: const EdgeInsets.all(10),
        child: Center(
          child: widget.cardChild,
        ),
      ),
    );
  }
}
