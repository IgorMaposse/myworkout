import 'package:flutter/material.dart';
import 'package:myworkout/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.\

  @override
  Widget build(BuildContext context) {
    Color myColor = Theme.of(context).colorScheme.secondary;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(29, 34, 37, 0.9)), //cor da app bar
        canvasColor: Colors.transparent,
        accentColor: const Color.fromRGBO(0, 233, 100, 1),

        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardColor: const Color.fromRGBO(60, 70, 72, 0.9), //cor do card usado
        scaffoldBackgroundColor:const Color.fromRGBO(29, 34, 37, 0.9),
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
          subtitle2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(152, 152, 152, 1),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
