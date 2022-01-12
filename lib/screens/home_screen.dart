import 'package:flutter/material.dart';
import 'package:myworkout/utils/Utils.dart';
import 'package:myworkout/widgets/app_drawer.dart';
import 'package:myworkout/widgets/today_workout.dart';

class HomeScreen extends StatelessWidget {
  List<ElevatedButton> _getButtonBar() {
    int day = 1;
    List<ElevatedButton> _list = [];
    for (int i = 1; i < 8; i++) {
      _list.add(
        ElevatedButton(
          onPressed: () => print('Botao $i'),
          child: Text(Utils.getWeekDayName(i)),
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
      //estender o corpo por tras da app bar, assim obrigou a a colocar pading na coluna que tem os botoes
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg3.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, //colocar os botoes de forma horizontal
                  child: ButtonBar(
                    children: _getButtonBar(),
                  ),
                ),
                TodayWorkout(), //widget
              ],
            ),
          ),
        ],
      ),
    );
  }
}
