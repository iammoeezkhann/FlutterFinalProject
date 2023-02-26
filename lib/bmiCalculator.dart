import 'package:flutter/material.dart';

class BMICalc extends StatefulWidget {
  const BMICalc({Key? key}) : super(key: key);

  @override
  State<BMICalc> createState() => _BMICalcState();
}

class _BMICalcState extends State<BMICalc> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmi = 0.0;

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100.0;
    double weight = double.parse(_weightController.text);

    setState(() {
      _bmi = weight / (height * height);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.red[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Height (cm)', focusColor: Colors.red),
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Calculate BMI'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red[700],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'BMI: ${_bmi.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
