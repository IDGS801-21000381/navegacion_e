import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'display_screen.dart';
import 'edit_screen.dart';

final Map<String, WidgetBuilder> rutas = {
  '/': (context) => RegistrationScreen(),
  '/display': (context) =>
      DisplayScreen(name: ModalRoute.of(context)!.settings.arguments as String),
  '/edit': (context) =>
      EditScreen(name: ModalRoute.of(context)!.settings.arguments as String),
};
