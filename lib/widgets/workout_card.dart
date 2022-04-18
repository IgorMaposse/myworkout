import 'package:flutter/material.dart';
import 'package:myworkout/screens/exercise_screen.dart';
import 'package:myworkout/utils/Utils.dart';
import 'package:myworkout/widgets/workout_screen_custom_cliper.dart';

class WorkoutCard extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  int? weekday;
  WorkoutCard(this.imageUrl, this.name, this.weekday);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _query = MediaQuery.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          SizedBox(
            width: _query.size.width * 0.4,
            child: ClipPath(
              clipper: WorkoutScreenCustomCliper(),
              child: Image(
                image: NetworkImage(imageUrl!),
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  name!,
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(Utils.getWeekDayName(weekday!),
                    style: Theme.of(context).textTheme.subtitle2),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: OutlineButton(
                      child: Text('Exercicios'),
                      onPressed: () =>
                          Navigator.of(context).pushNamed(ExerciseScreen.route),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(0, 233, 100, 1),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
