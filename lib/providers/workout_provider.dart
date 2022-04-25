import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myworkout/models/workout.dart';

class WorkoutProvider with ChangeNotifier {
  List<Workout> _workouts = [];
  Future<List<Workout>> get() async {
    return await Future.delayed(const Duration(seconds: 2), () => _workouts);
  }

  Future<void> add(Workout w) async {
    w.id = Random().nextInt(100).toString();
    _workouts.add(w);
    notifyListeners(); // notifica ao widgets que alguma aletaracao foi feita
  }

  Future<void> update(Workout w) async {
    _workouts = _workouts.map((e) {
      if (e.id == w.id) {
        e.imageUrl = w.imageUrl;
        e.name = w.name;
        e.weekDay = w.weekDay;
      }
      return e;
    }).toList();
    notifyListeners();
  }

  Workout getById(String id) {
    return _workouts.firstWhere((element) => element.id == id);
  }
}
