import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class HeightCard extends StatefulWidget {


  HeightCard({
    required this.height,
    required this.onChange,
    super.key,
  });

  int height;

  final Function(double) onChange;

  @override
  State<HeightCard> createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kActiveCardColor,
            ),
            //color: Color(0xFF1D1E33),
            margin: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: kCardTextStyle,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.height.toString(),
                          style: kMeasureNumberStyle),
                      const Text(" CM", style: kUnitStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      overlayColor: const Color(0x29E91E63),
                      thumbColor: Colors.pink,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                        value: widget.height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        //activeColor: Colors.white,
                        //inactiveColor: Colors.grey,
                        onChanged: widget.onChange

                        //     (double newValue) {
                        //   setState(() {
                        //     widget.height = newValue.round();
                        //   });
                        // }

                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
