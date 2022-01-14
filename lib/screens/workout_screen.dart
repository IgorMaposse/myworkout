import 'package:flutter/material.dart';
import 'package:myworkout/widgets/app_drawer.dart';
import 'package:myworkout/widgets/workout_screen_custom_cliper.dart';

class WorkOutScreen extends StatelessWidget {
  static const route = '/workout';

  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context);

    var value = ModalRoute.of(context)!
        .settings
        .arguments; //recebendo argumentos de outra pagina

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Treinos'),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  SizedBox(
                    width: _query.size.width * 0.4,
                    child: ClipPath(
                      clipper: WorkoutScreenCustomCliper(),
                      child: const Image(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1552674605-db6ffd4facb5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'),
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Text('corrida'),
                        Text('Sabado'),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            child: Text('Exercicios'),
                            onPressed: null,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
