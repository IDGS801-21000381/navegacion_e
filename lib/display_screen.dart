import 'package:flutter/material.dart';
import 'shared_preferences_util.dart';

class DisplayScreen extends StatelessWidget {
  final String name;

  DisplayScreen({required this.name});

  void _editName(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/edit',
      arguments: name,
    );
  }

  void _removeUser(BuildContext context) async {
    await SharedPreferencesUtil.clearPreferences();
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mostrar Nombre')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hola, $name!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _editName(context),
              child: Text('Editar Nombre'),
            ),
            ElevatedButton(
              onPressed: () => _removeUser(context),
              child: Text('Eliminar Usuario'),
            ),
          ],
        ),
      ),
    );
  }
}
