import 'package:flutter/material.dart';

InputDecoration tF_decoration(BuildContext context,String label) {
  return InputDecoration(
        labelText: label,
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
      );
}