import 'package:flutter/material.dart';
import 'shared_preferences_util.dart';

class EditScreen extends StatefulWidget {
  final String name;

  EditScreen({required this.name});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController _nameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _passwordController = TextEditingController();
  }

  void _saveUser() async {
    if (_nameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      await SharedPreferencesUtil.setName(_nameController.text);
      await SharedPreferencesUtil.setPassword(
          int.parse(_passwordController.text));
      Navigator.pushReplacementNamed(
        context,
        '/display',
        arguments: _nameController.text,
      );
    }
  }

  void _cancelEdit() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Nombre')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Ingrese su nombre'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Ingrese su contraseña'),
              keyboardType: TextInputType.number,
              obscureText: true,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: _cancelEdit, child: Text('Cancelar')),
                ElevatedButton(onPressed: _saveUser, child: Text('Guardar')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
