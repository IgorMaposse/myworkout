import 'package:flutter/material.dart';
import 'package:myworkout/models/workout.dart';
import 'package:myworkout/providers/workout_provider.dart';
import 'package:myworkout/screens/exercise_screen.dart';
import 'package:myworkout/screens/workout_screen_management.dart';
import 'package:myworkout/widgets/app_drawer.dart';
import 'package:myworkout/widgets/workout_card.dart';
import 'package:myworkout/widgets/workout_screen_custom_cliper.dart';
import 'package:provider/provider.dart';

class WorkOutScreen extends StatelessWidget {
  static const route = '/workout';

  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context);
    //final workouts = Provider.of<WorkoutProvider>(context).get();
    // print(workouts);
    var value = ModalRoute.of(context)!
        .settings
        .arguments; //recebendo argumentos de outra pagina

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Treinos'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pushNamed(
                  WorkoutScreenManagement.route,
                  arguments: {'title': 'Novo Treino'}),
              icon: Icon(Icons.add))
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //quando dependemos de uma resposta futura usamos ja nao usamos o consumer, mas sim o widget que facilita o trabalho com essas funcoes assucronas, esse eh o futurebuilder
          /*
          Padding(
            padding: const EdgeInsets.only(top: 113),
            child: Consumer<WorkoutProvider>(
              builder: (_, provider, child) {
                print('consummer');
                return WorkoutCard();
              },
            ),
          ),
         */
          FutureBuilder(
            future: Provider.of<WorkoutProvider>(context).get(),
            builder: (context, AsyncSnapshot<List<Workout>> snapshot) {
              var data = snapshot.data;

              return snapshot.connectionState == ConnectionState.done
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        return WorkoutCard(
                            snapshot.data![index].id,
                            snapshot.data![index].imageUrl,
                            snapshot.data![index].name,
                            snapshot.data![index].weekDay);
                      })
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
