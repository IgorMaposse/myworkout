import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:myworkout/screens/home_screen.dart';
import 'package:myworkout/screens/workout_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromRGBO(29, 36, 41, 0.8),
        child: ListView(
          children: [
            ListTile(
              // ignore: deprecated_member_use
              leading: const Icon(Icons.home, color: Colors.green),
              title: Text('Home'),
              onTap: () => Navigator.of(context)
                  .pushNamed(HomeScreen.route, arguments: 100),
            ),
            ListTile(
              leading: const Icon(Icons.fitness_center, color: Colors.green),
              title: Text('Treinos'),
              onTap: () => Navigator.of(context)
                  .pushNamed(WorkOutScreen.route, arguments: 100),
            ),
          ],
        ),
      ),
    );
  }
}
