import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class GameParameters extends StatelessWidget {
  const GameParameters({super.key});

  static const routeName = '/game_parameters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Parameters'),
      ),
      body: const Center(
        //TODO: Develop the different games to play here.
        child: Text('Over here the user should be able to choose number of digits, amount of numbers to play with and the time to respond.'),
      ),
    );
  }
}
