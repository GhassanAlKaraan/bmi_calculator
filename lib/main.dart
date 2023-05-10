import 'screens/results_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';
//main dart file usually will have all the themes and colors.

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My BMI Calculator",
      theme: ThemeData(
        fontFamily: "Changa",
        primaryColor: const Color(0xFF03012C),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF4C4F5E),
        ),
      ),
      //home: const Inputpage(), //when use routes, do not use home
      initialRoute: '/',
      routes: {
        '/': (context) => const Inputpage(),
        // '/result': (context) => ResultsPage(),
        //I dont need this route for now, I am not using pushNamed()
      },

      debugShowCheckedModeBanner: false, // DISABLE DEBUG BANNER
    );
  }
}
