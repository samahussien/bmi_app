import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;
  double? _bmi;
  CalculatorBrain({required this.weight, required this.height});
  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String result() {
    if (_bmi! >= 25) {
      return 'overweight';
    } else if (_bmi! > 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String getInterpretations() {
    if (_bmi! >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi! > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than a normal body eight. You can eat a bit more.';
    }
  }
}
