import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AdditionScreen extends StatefulWidget {
  static const routeName = '/addition_screen';

  final int numberOfNumbers;
  final int numberOfDigits;
  final int timeLimit;

  AdditionScreen({
    required this.numberOfNumbers,
    required this.numberOfDigits,
    required this.timeLimit,
  });

  @override
  _AdditionScreenState createState() => _AdditionScreenState();
}

class _AdditionScreenState extends State<AdditionScreen> {
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
    correctAnswer = numbers.reduce((a, b) => a + b);
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
      timeLeft += 5;
      showPopup('Correct answer', Colors.lightGreen);
      //TODO: Add something here to extend the timer.
      //Also refresh generated numbers and rebuild widget I think.
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
        title: const Text('Addition Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //TODO: fix how the numbers get display. I looks ugly right now.
              Text(
                'Numbers: ${numbers}',
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
                print(widget.numberOfNumbers.toString() + " one");
                print(widget.numberOfDigits.toString() + " two");
                print(widget.timeLimit.toString() + " Three");
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
