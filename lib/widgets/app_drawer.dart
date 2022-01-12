import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Drawer(
      child: Container(
        color: Color.fromRGBO(29, 36, 41, 0.8),
        child: ListView(
          children: [
            ListTile(
              // ignore: deprecated_member_use
              leading: const Icon(Icons.home, color: Colors.green),
              title: Text('Home'),
              onTap: () => print('Home'),
            ),
            ListTile(
              leading: const Icon(Icons.fitness_center, color: Colors.green),
              title: Text('Treinos'),
              onTap: () => print('Treinos'),
            ),
          ],
        ),
      ),
    );
  }
}
