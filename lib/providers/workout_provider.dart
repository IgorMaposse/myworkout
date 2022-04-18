import 'package:flutter/material.dart';
import 'package:myworkout/models/workout.dart';

class WorkoutProvider with ChangeNotifier {
  List<Workout> _workouts = [];
  Future<List<Workout>> get() async {
    return await Future.delayed(const Duration(seconds: 2), () => _workouts);
  }

  Future<void> add(Workout w) async {
    _workouts.add(w);
    notifyListeners(); // notifica ao widgets que alguma aletaracao foi feita
  }
}
