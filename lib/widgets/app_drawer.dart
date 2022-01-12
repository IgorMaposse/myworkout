import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('Treinos'),
              onTap: () => print('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
