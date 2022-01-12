import 'package:flutter/material.dart';
import 'package:myworkout/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        cardColor: Color.fromRGBO(60, 70, 72, 0.9),
        scaffoldBackgroundColor: Color.fromRGBO(29, 34, 37, 0.9),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
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
