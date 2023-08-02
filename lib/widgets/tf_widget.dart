import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput(
      {super.key,
      required this.labelText,
      required this.controller,
      this.obscureText = false,
      required this.onChanged});
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodyText1,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
    );
  }
}