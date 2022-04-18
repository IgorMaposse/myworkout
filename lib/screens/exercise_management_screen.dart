import 'package:flutter/material.dart';

class ExerciseManagementScreen extends StatefulWidget {
  static const String route = '/exercise-management';

  @override
  State<ExerciseManagementScreen> createState() =>
      _ExerciseManagementScreenState();
}

class _ExerciseManagementScreenState extends State<ExerciseManagementScreen> {
  final _imageFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  void _save() {
    bool valid = _formKey.currentState!.validate();
    if (valid) {
      print('formulario valido');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Exercicios'),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/bg4.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Nome'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.length < 3) {
                          return 'O nome deve contare pelo menos 3 caracteres';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_imageFocus),
                    ),
                    TextFormField(
                      focusNode: _imageFocus,
                      decoration: const InputDecoration(labelText: 'Image URL'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (!value!.startsWith('https://') ||
                            !value.startsWith('http://')) {
                          return 'Incorrecto';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_descriptionFocus),
                    ),
                    TextFormField(
                      focusNode: _descriptionFocus,
                      decoration: const InputDecoration(labelText: 'Descricao'),
                      textInputAction: TextInputAction.next,
                      maxLength: 100,
                      minLines: 3,
                      maxLines: 5,
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'A descricao deve contare pelo menos 5 caracteres';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_imageFocus),
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _save,
                        child: const Text(
                          'Salvar',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
