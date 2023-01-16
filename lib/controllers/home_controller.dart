import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final results = [].obs;
  final history = [].obs;
  final firstNumber = TextEditingController();
  final secondNumber = TextEditingController();
  final function = "".obs;

  @override
  void onClose() {
    firstNumber.dispose();
    secondNumber.dispose();
    super.onClose();
  }

  void addFunc() {
    final result = double.parse(firstNumber.text) + double.parse(secondNumber.text);
    fixed(result);
  }

  void substract() {
    final result = double.parse(firstNumber.text) - double.parse(secondNumber.text);
    fixed(result);
  }

  void divide() {
    final result = double.parse(firstNumber.text) / double.parse(secondNumber.text);
    fixed(result);
  }

  void multiply() {
    final result = double.parse(firstNumber.text) * double.parse(secondNumber.text);
    fixed(result);
  }

  void clear() {
    results.clear();
    firstNumber.clear();
    secondNumber.clear();
  }

  void fixed(double result) {
    history.add(result);
    if (results.length < 5) {
      results.add(result);
    } else {
      results.add(result);
      results.remove(results[0]);
    }
    firstNumber.clear();
    secondNumber.clear();
  }
}
