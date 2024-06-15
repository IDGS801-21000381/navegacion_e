import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'display_screen.dart';
import 'shared_preferences_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? savedName = await SharedPreferencesUtil.getName();
  bool? userRegistered = await SharedPreferencesUtil.getUserRegistered();
  runApp(MyApp(savedName: savedName, userRegistered: userRegistered));
}

class MyApp extends StatelessWidget {
  final String? savedName;
  final bool? userRegistered;

  MyApp({this.savedName, this.userRegistered});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación de Registro de Nombre',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: userRegistered == true
          ? DisplayScreen(name: savedName!)
          : RegistrationScreen(),
    );
  }
}
