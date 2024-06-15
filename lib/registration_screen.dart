import 'package:flutter/material.dart';
import 'shared_preferences_util.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = '';
    _passwordController.text = '';
  }

  void _saveUser() async {
    if (_nameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      await SharedPreferencesUtil.setName(_nameController.text);
      await SharedPreferencesUtil.setPassword(
          int.parse(_passwordController.text));
      await SharedPreferencesUtil.setUserRegistered(true);
      Navigator.pushReplacementNamed(
        context,
        '/display',
        arguments: _nameController.text,
      );
    }
  }

  void _clearFields() {
    _nameController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Ingrese su nombre'),
              autofocus: true,
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
                ElevatedButton(
                    onPressed: _clearFields, child: Text('Cancelar')),
                ElevatedButton(onPressed: _saveUser, child: Text('Guardar')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
