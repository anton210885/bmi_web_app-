import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("BMI Rechner")),
        body: BMIForm(),
      ),
    );
  }
}

class BMIForm extends StatefulWidget {
  @override
  _BMIFormState createState() => _BMIFormState();
}

class _BMIFormState extends State<BMIForm> {
  double height = 170;
  double weight = 70;
  double bmi = 0;
  String result = "";

  void calculateBMI() {
    setState(() {
      bmi = weight / ((height / 100) * (height / 100));
      if (bmi < 18.5) result = "Untergewicht";
      else if (bmi < 25) result = "Normalgewicht";
      else if (bmi < 30) result = "Übergewicht";
      else result = "Adipositas";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Slider(
            value: height,
            min: 100,
            max: 220,
            onChanged: (val) => setState(() => height = val),
          ),
          Text("Größe: ${height.round()} cm"),
          Slider(
            value: weight,
            min: 30,
            max: 150,
            onChanged: (val) => setState(() => weight = val),
          ),
          Text("Gewicht: ${weight.round()} kg"),
          ElevatedButton(
            onPressed: calculateBMI,
            child: Text("BMI berechnen"),
          ),
          if (bmi > 0) Text("BMI: ${bmi.toStringAsFixed(1)} ($result)"),
        ],
      ),
    );
  }
}