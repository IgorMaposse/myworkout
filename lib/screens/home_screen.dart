import 'package:flutter/material.dart';
import 'package:myworkout/utils/Utils.dart';
import 'package:myworkout/widgets/app_drawer.dart';
import 'package:myworkout/widgets/today_workout.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/';

  List<ElevatedButton> _getButtonBar() {
    int day = 1;
    List<ElevatedButton> _list = [];
    for (int i = 1; i < 8; i++) {
      _list.add(
        ElevatedButton(
          onPressed: () => print('Botao $i'),
          child: Text(Utils.getWeekDayName(i).substring(0, 3)),
        ),
      );
    }
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 110,
            ),
            child: Column(
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ButtonBar(
                    children: _getButtonBar(),
                  ),
                ),
                TodayWorkout()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
