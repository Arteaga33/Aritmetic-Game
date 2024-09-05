import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'widgets/game_parameters.dart';
import 'screens/addition_screen.dart';
import 'screens/substraction_screen.dart';
import 'screens/multiplication_screen.dart';
import 'screens/division_screen.dart';
import 'widgets/buttons_list.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';
import 'model/parameters_data.dart';

/// The Widget that configures your application.
/// Simple flutter clean to avoid showing C++ tag on git hub.
class AritmeticGame extends StatelessWidget {
  const AritmeticGame({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: ParametersData(),
          )
        ],
        child: AnimatedBuilder(
          animation: settingsController,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              // Providing a restorationScopeId allows the Navigator built by the
              // MaterialApp to restore the navigation stack when a user leaves and
              // returns to the app after it has been killed while running in the
              // background.
              restorationScopeId: 'aritmeticgameapp',

              // Provide the generated AppLocalizations to the MaterialApp. This
              // allows descendant Widgets to display the correct translations
              // depending on the user's locale.
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''), // English, no country code
              ],

              // Use AppLocalizations to configure the correct application title
              // depending on the user's locale.
              //
              // The appTitle is defined in .arb files found in the localization
              // directory.
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context)!.appTitle,

              // Define a light and dark color theme. Then, read the user's
              // preferred ThemeMode (light, dark, or system default) from the
              // SettingsController to display the correct theme.
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.blueGrey,
                primaryColor: Colors.white,
                dividerColor: Colors.white54,
                /* light theme settings */
              ),
              darkTheme: ThemeData.dark(),
              themeMode: settingsController.themeMode,

              // Define a function to handle named routes in order to support
              // Flutter web url navigation and deep linking.
              onGenerateRoute: (RouteSettings routeSettings) {
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) {
                    switch (routeSettings.name) {
                      case SettingsView.routeName:
                        return SettingsView(controller: settingsController);
                      case GameParameters.routeName:
                        return GameParameters(
                            mathOperation:
                                Provider.of<ParametersData>(context).mathData);
                      case SubstractionScreen.routeName:
                        return SubstractionScreen(
                          numberOfNumbers: Provider.of<ParametersData>(context)
                              .numberOfNumbers,
                          numberOfDigits: Provider.of<ParametersData>(context)
                              .numberOfNumbers,
                          timeLimit:
                              Provider.of<ParametersData>(context).timeLimit,
                        );
                      case AdditionScreen.routeName:
                        return AdditionScreen(
                          numberOfNumbers: Provider.of<ParametersData>(context)
                              .numberOfNumbers,
                          numberOfDigits: Provider.of<ParametersData>(context)
                              .numberOfNumbers,
                          timeLimit:
                              Provider.of<ParametersData>(context).timeLimit,
                        );
                      case MultiplicationScreen.routeName:
                        return MultiplicationScreen(
                          numberOfNumbers: Provider.of<ParametersData>(context)
                              .numberOfNumbers,
                          numberOfDigits: Provider.of<ParametersData>(context)
                              .numberOfNumbers,
                          timeLimit:
                              Provider.of<ParametersData>(context).timeLimit,
                        );
                      case DivisionScreen.routeName:
                        return DivisionScreen(
                          numberOfNumbers: Provider.of<ParametersData>(context)
                              .numberOfNumbers,
                          numberOfDigits: Provider.of<ParametersData>(context)
                              .numberOfNumbers,
                          timeLimit:
                              Provider.of<ParametersData>(context).timeLimit,
                        );
                      case ButtonsList.routeName:
                      default:
                        return const ButtonsList();
                    }
                  },
                );
              },
            );
          },
        ));
  }
}
