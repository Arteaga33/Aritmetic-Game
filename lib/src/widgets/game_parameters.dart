import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/parameters_data.dart';
import '../screens/addition_screen.dart';
import '../screens/substraction_screen.dart';
import '../screens/multiplication_screen.dart';
import '../screens/division_screen.dart';

/// Game parameters chosen by the user as Input
/// TODO: use the recieved parameters for each Arithmetic Game.
class GameParameters extends StatefulWidget {
  static const routeName = '/game_parameters';

  final String mathOperation;

  const GameParameters({super.key, required this.mathOperation});

  @override
  GameParametersState createState() => GameParametersState();
}

class GameParametersState extends State<GameParameters> {
  final TextEditingController _numberOfNumbersController =
      TextEditingController();
  final TextEditingController _numberOfDigitsController =
      TextEditingController();
  final TextEditingController _timeLimitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Parameters'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _numberOfNumbersController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount of Numbers',
                hintText: 'Enter amount of numbers',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _numberOfDigitsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity of Digits',
                hintText: 'Enter number of digits',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _timeLimitController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Time Limit (seconds)',
                hintText: 'Enter time limit in seconds',
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                //The text controller has the info.
                // Validate and process the input parameters
                int numberOfNumbers =
                    int.tryParse(_numberOfNumbersController.text) ?? 2;
                int numberOfDigits =
                    int.tryParse(_numberOfDigitsController.text) ?? 1;
                int timeLimit = int.tryParse(_timeLimitController.text) ?? 3;
                //Pass info to the provider.
                Provider.of<ParametersData>(context, listen: false).updateNumberOfNumbers(numberOfNumbers);
                Provider.of<ParametersData>(context, listen: false).updateNumberOfDigits(numberOfDigits);
                Provider.of<ParametersData>(context, listen: false).updateTimeLimit(timeLimit);
                switch (widget.mathOperation) {
                  case 'Addition':
                  //Add function
                    Navigator.restorablePushNamed(
                      context,
                      AdditionScreen.routeName,
                    );
                    break;
                  case 'Subtraction':
                    Navigator.restorablePushNamed(
                      context,
                      SubstractionScreen.routeName,
                    );
                    break;
                  case 'Multiplication':
                    Navigator.restorablePushNamed(
                      context,
                      MultiplicationScreen.routeName,
                    );
                    break;
                  case 'Division':
                    Navigator.restorablePushNamed(
                      context,
                      DivisionScreen.routeName,
                    );
                    break;
                }
              },
              child: Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}
