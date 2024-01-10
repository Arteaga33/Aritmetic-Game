import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'package:aritmetic_game/src/widgets/operations_buttons.dart';
import '../widgets/game_parameters.dart';

/// Displays a list of SampleItems.
class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
    this.items = const [
      OperationsButtons('Addition', 'assets/images/addition.jpg'),
      OperationsButtons('Subtraction', 'assets/images/subtraction.png'),
      OperationsButtons('Multiplication', 'assets/images/multiplication.png'),
      OperationsButtons('Division', 'assets/images/division.png')
    ],
  });

  static const routeName = '/';

  final List<OperationsButtons> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Math Practice'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'MainScreen',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text(item.mathOperation),
              leading: CircleAvatar(
                // Display the Flutter Logo image asset.
                //TODO: pending to repair because it's not picking up the images.
                foregroundImage: AssetImage(item.mathOperationIcon),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(
                  context,
                  GameParameters.routeName,
                );
              });
        },
      ),
    );
  }
}
