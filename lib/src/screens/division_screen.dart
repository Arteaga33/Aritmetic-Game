import 'dart:async';
import 'dart:js_util';
import 'dart:math';

import 'package:flutter/material.dart';

class DivisionScreen extends StatefulWidget {
  static const routeName = '/division_screen';

  final int numberOfNumbers;
  final int numberOfDigits;
  final int timeLimit;

  DivisionScreen({
    required this.numberOfNumbers,
    required this.numberOfDigits,
    required this.timeLimit,
  });

  @override
  _DivisionScreenState createState() => _DivisionScreenState();
}

class _DivisionScreenState extends State<DivisionScreen> {
  late List<int> numbers;
  late int correctAnswer;
  late int timeLeft;
  late Timer timer;

  final TextEditingController _answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    generateNumbers();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void generateNumbers() {
    Random random = Random();
    numbers = List.generate(
      widget.numberOfNumbers,
      (index) => random.nextInt(pow(10, widget.numberOfDigits).toInt()),
    );
    correctAnswer = numbers.reduce((a, b) => divide(a, b) );
  }

  void startTimer() {
    timeLeft = widget.timeLimit;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timeLeft--;
        if (timeLeft <= 0) {
          timer.cancel();
          // Handle time over event here
        }
      });
    });
  }

  void validateAnswer(String answer) {
    int userAnswer = int.tryParse(answer) ?? 0;
    if (userAnswer == correctAnswer) {
      showPopup('Correct answer', Colors.lightGreen);
    } else {
      showPopup('Incorrect answer, keep trying', Colors.red);
    }
  }

  void showPopup(String message, Color backgroundColor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          content: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Division Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Numbers: $numbers',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _answerController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Answer',
                hintText: 'Enter your answer here',
              ),
            ),
            const SizedBox(height: 16.0),
            LinearProgressIndicator(
              value: timeLeft / widget.timeLimit,
              minHeight: 20.0,
              backgroundColor: Colors.grey,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                validateAnswer(_answerController.text);
              },
              child: const Text('Submit Answer'),
            ),
          ],
        ),
      ),
    );
  }
}
