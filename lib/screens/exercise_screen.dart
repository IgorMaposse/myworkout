import 'package:flutter/material.dart';
import 'package:myworkout/screens/exercise_management_screen.dart';

class ExerciseScreen extends StatefulWidget {
  ExerciseScreen({Key? key}) : super(key: key);
  static const String route = '/exercise';
  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercicio Cadastro'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .pushNamed(ExerciseManagementScreen.route),
              icon: Icon(Icons.add))
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg4.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 115),
            child: Card(
              child: ListTile(
                title: Text(
                  "60 Minutos de Corrida",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    'Manter velocidade constante de corrida por 60 minutos',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.subtitle2?.color)),
                leading: Image.network(
                  'https://images.unsplash.com/photo-1552674605-db6ffd4facb5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
