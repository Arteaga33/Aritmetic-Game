import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../settings/settings_view.dart';
import 'game_parameters.dart';
import 'operations_buttons.dart';
import '../model/parameters_data.dart';

/// Displays a list of SampleItems.
class ButtonsList extends StatelessWidget {
  const ButtonsList({
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
    double screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = AppBar().preferredSize.height;
    double firstColumnHeight = 0.35 * (screenHeight - appBarHeight);
    double secondColumnHeight = 0.7 * (screenHeight - appBarHeight);
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
        body: Column(
          children: [
            Container(
              height: firstColumnHeight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  'assets/images/GameDec.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: Container(
                  height: secondColumnHeight,
                  child: ListView.builder(
                    // Providing a restorationId allows the ListView to restore the
                    // scroll position when a user leaves and returns to the app after it
                    // has been killed while running in the background.
                    restorationId: 'ButtonsList',
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = items[index];
                      return ListTile(
                          title: Text(item.mathOperation),
                          leading: CircleAvatar(
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
                            Provider.of<ParametersData>(context, listen: false).updateMathOperationData(item.mathOperation);
                          });
                    },
                  ),
                ),
            ),
          ],
        ));
  }
}
