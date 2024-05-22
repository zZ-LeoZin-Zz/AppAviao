import 'package:flutter/material.dart';

class custom_from_text_field_aero extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const custom_from_text_field_aero({
    super.key,
    required this.labelText,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
      validator: validator,
    );
  }
}
