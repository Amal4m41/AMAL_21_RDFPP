import 'package:amal_21_rdfpp/screens/control_panel_screen.dart';
import 'package:amal_21_rdfpp/screens/light_screen.dart';
import 'package:amal_21_rdfpp/screens/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: ControlPanelScreen.id,
      routes: {
        ControlPanelScreen.id: (context) => const ControlPanelScreen(),
        ProfileScreen.id: (context) => const ProfileScreen(),
      },
      //For named routes with arguments
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (settings.name == LightScreen.id) {
          // Cast the arguments to the correct
          // type: ScreenArguments.
          final args = settings.arguments as LightScreenArguments;
          // print('ARGS VALUE: $args');
          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return LightScreen(
                roomName: args.roomName,
                numberofLights: args.numberofLights,
              );
            },
          );
        }
        // The code only supports
        // PassArgumentsScreen.routeName right now.
        // Other values need to be implemented if we
        // add them. The assertion here will help remind
        // us of that higher up in the call stack, since
        // this assertion would otherwise fire somewhere
        // in the framework.
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
