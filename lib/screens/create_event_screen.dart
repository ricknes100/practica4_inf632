import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {

  String description = '';
  String date = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo evento'),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Evento Registrado'),
                    backgroundColor: Colors.blue[700],
                    duration: const Duration(seconds: 2),
                  ),
                );
                Navigator.of(context).pop({'description': description, 'date': date});
              }
            },
            child: const Text('GUARDAR'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => description = value,
                validator: (value) {
                  if (value!.isEmpty) return 'Campo requerido';
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Fecha',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => date = value,
                validator: (value) {
                  if (value!.isEmpty) return 'Campo requerido';
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
