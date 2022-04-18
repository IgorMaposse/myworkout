import 'package:flutter/material.dart';
import 'package:myworkout/models/workout.dart';
import 'package:myworkout/providers/workout_provider.dart';
import 'package:provider/provider.dart';

class WorkoutScreenManagement extends StatefulWidget {
  WorkoutScreenManagement({Key? key}) : super(key: key);
  static const String route = '/workout-management';
  @override
  State<WorkoutScreenManagement> createState() =>
      _WorkoutScreenManagementState();
}

class _WorkoutScreenManagementState extends State<WorkoutScreenManagement> {
  final _imageFocus = FocusNode();

  final _DropdownFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _dropdownValid = true;
  int? _dropdownValue;
  int? a;

  // Workout _workout = Workout('3674', 'Igor', 'https://igor/hd.png', 1);
  Workout _workout = Workout();

  final List<Map<String, Object>> dropdown_options = [
    {'id': 1, 'name': 'Segunda-Feira'},
    {'id': 2, 'name': 'Terca-Feira'},
    {'id': 3, 'name': 'Quarta-Feira'},
    {'id': 4, 'name': 'Quinta-Feira'},
    {'id': 5, 'name': 'Sexta-Feira'},
    {'id': 6, 'name': 'Sabado'},
    {'id': 7, 'name': 'Domingo'}
  ];
  _save() async {
    bool? valid = _formKey.currentState?.validate();
    if (_dropdownValue! > 0 && _dropdownValue != null) {
      setState(() {
        _dropdownValid = true;
      });
    } else {
      setState(() {
        _dropdownValid = false;
      });
    }
    if (valid == true && _dropdownValid == true) {
      _formKey.currentState!.save();
      _workout.weekDay = _dropdownValue;
      await Provider.of<WorkoutProvider>(context, listen: false).add(_workout);
      Navigator.of(context).pop();
      //Provider<WorkoutProvider>(context).
    } else {
      print('formulario invalidado');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object>? arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>?;
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Treino'),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(110),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _workout.name,
                      onSaved: (value) => _workout.name = value,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_imageFocus);
                      },
                      decoration: InputDecoration(labelText: 'Nome'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 3) {
                          return 'O nome deve conter pelo menos 3 caracteres';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: _workout.imageUrl,
                      onSaved: (value) => _workout.imageUrl = value,
                      focusNode: _imageFocus,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_DropdownFocus);
                      },
                      decoration: InputDecoration(labelText: 'Image URL'),
                      validator: (value) {
                        if (!value!.startsWith('https://') &&
                            !value.startsWith('http://')) {
                          return 'Endereco de imagem invalido';
                        }
                      },
                    ),
                    SizedBox(
                      height: 0.5,
                    ),
                    DropdownButtonHideUnderline(
                      child: Container(
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                        padding: EdgeInsets.all(15),
                        child: DropdownButton(
                          value: _dropdownValue,
                          focusNode: _DropdownFocus,
                          items: dropdown_options
                              .map((e) => DropdownMenuItem(
                                    child: Text(e['name'] as String),
                                    value: e['id'],
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _dropdownValue = int.parse(value.toString());
                            });
                          },
                          hint: Text(
                            'Dia de Semana',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .color),
                          ),
                          icon: Icon(Icons.calendar_today),
                          isExpanded: true,
                          iconEnabledColor: Theme.of(context).accentColor,
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.subtitle1!.fontSize,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                          dropdownColor: Color.fromRGBO(48, 56, 62, 0.9),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _dropdownValid ? '' : 'Selecione um dia da semana',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _save,
                        child: Text(
                          'Salvar',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline1?.color),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
