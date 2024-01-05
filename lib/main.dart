// import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'results_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
    ),

      // theme: ThemeData(
      //   primaryColor: Color(0xFF0A0E21),
      //   scaffoldBackgroundColor: Color(0xFF0A0E21),
      //   textTheme: TextTheme(
      //   bodyLarge: const TextStyle(color: Color(0xFFFFFFFF)),
      //   ),
      // ),
      home: InputPage(),
      // initialRoute: '/',
      // routes: {
      //   '/':(context) => InputPage(),
      //   '/second':(context) => ResultsPage(),
      // },
    );
  }
}

