import 'package:flutter/material.dart';

/// Game parameters chosen by the user as Input
/// TODO: use the recieved parameters for each Arithmetic Game.
class GameParameters extends StatefulWidget {
  static const routeName = '/game_parameters';

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
                labelText: 'Number of Numbers',
                hintText: 'Enter number of numbers',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _numberOfDigitsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Number of Digits',
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
                // Validate and process the input parameters
                int numberOfNumbers = int.tryParse(_numberOfNumbersController.text) ?? 0;
                int numberOfDigits = int.tryParse(_numberOfDigitsController.text) ?? 0;
                int timeLimit = int.tryParse(_timeLimitController.text) ?? 0;

                // Proceed with the game setup or validation
                // You can navigate to the game screen here passing the parameters,
                // or perform any other actions based on the input parameters.
              },
              child: Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}
