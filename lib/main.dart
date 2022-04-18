import 'package:flutter/material.dart';
import 'package:myworkout/providers/workout_provider.dart';
import 'package:myworkout/screens/exercise_management_screen.dart';
import 'package:myworkout/screens/exercise_screen.dart';
import 'package:myworkout/screens/home_screen.dart';
import 'package:myworkout/screens/workout_screen.dart';
import 'package:myworkout/screens/workout_screen_management.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.\

  @override
  Widget build(BuildContext context) {
    Color myColor = Theme.of(context).colorScheme.secondary;

    return ChangeNotifierProvider(
      create: (_) => WorkoutProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: Color.fromRGBO(29, 34, 37, 0.9)), //cor da app bar
          canvasColor: Colors.transparent,
          accentColor: const Color.fromRGBO(0, 233, 100, 1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          cardColor: const Color.fromRGBO(60, 70, 72, 0.9), //cor do card usado
          scaffoldBackgroundColor: const Color.fromRGBO(29, 34, 37, 0.9),
          textTheme: const TextTheme(
            //definir tema
            headline1: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),

            bodyText1: TextStyle(
              color: Colors.white,
            ),

            subtitle1: TextStyle(color: Colors.white),
            subtitle2: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(152, 152, 152, 1),
            ),
          ),

          inputDecorationTheme: const InputDecorationTheme(
            fillColor: Color.fromRGBO(48, 56, 62, 8.0),
            filled: true,
            border: InputBorder.none,
            labelStyle: TextStyle(
              color: Color.fromRGBO(151, 152, 152, 1),
            ),
          ),

          buttonTheme: ButtonThemeData(
              buttonColor: Color.fromRGBO(0, 233, 100, 1),
              colorScheme: Theme.of(context)
                  .colorScheme
                  .copyWith(primary: const Color.fromRGBO(0, 233, 100, 1))),
        ),
        // home: HomeScreen(),

        routes: {
          HomeScreen.route: (_) => HomeScreen(),
          WorkOutScreen.route: (_) => WorkOutScreen(),
          WorkoutScreenManagement.route: (_) => WorkoutScreenManagement(),
          ExerciseManagementScreen.route: (_) => ExerciseManagementScreen(),
          ExerciseScreen.route: (_) => ExerciseScreen(),
        },
      ),
    );
  }
}
