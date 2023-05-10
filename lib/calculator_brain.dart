import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({required this.height, required this.weight});

  final int height, weight;
  double _bmi = 18;

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return "OVERWEIGHT !";
    }else if(_bmi > 18.5){
      return "NORMAL";
    }else{
      return "UNDERWEIGHT !";
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return "VERY FAT, go to the gym";
    }else if(_bmi > 18.5){
      return "Wow. A normal human";
    }else{
      return "Too Skinny. Eat more";
    }
  }

}