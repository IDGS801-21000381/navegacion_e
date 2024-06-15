import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;

  CustomTextField({required this.controller, this.autoFocus = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autoFocus,
      decoration: InputDecoration(
        labelText: 'Nombre',
        border: OutlineInputBorder(),
      ),
    );
  }
}
