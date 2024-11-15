import 'package:flutter/material.dart';

import '../screens/create_event_screen.dart';
import '../widgets/delete_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Map<String, String>> _events = [
    {'description': 'Evento 1', 'date': '01/12/2024'},
  ];

  void _showDeleteEventDialog(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DeleteDialog(
              title: "Eliminar evento",
              content: "¿Esta seguro de eliminar el evento?",
              onDelete: (){
                setState(() {
                  _events.removeAt(index);
                });
              }
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos'),
      ),
      body: ListView.builder(
        itemCount: _events.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(Icons.event, color: Colors.blue),
            title: Text(_events[index]['description']!),
            subtitle: Text(_events[index]['date']!),
            trailing: IconButton(
              onPressed: () => _showDeleteEventDialog(index),
              icon: const Icon(Icons.delete_outline),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => const CreateEventScreen(),
            ),
          );

          if(result != null){
            setState(() {
              _events.add(result as Map<String, String>);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
