import 'package:flutter/material.dart';
import 'package:nexura/Core/utils/styles.dart';

import '../utils/theme.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.labelText,
    this.onSaved,
    this.validator,
    required this.icon,
    required this.controller,
  });

  final String labelText;
  final IconData icon;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Styles.textStyle18,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: white,
        filled: true,
        labelStyle: Styles.textStyle18.copyWith(color: grey),
        suffixIcon: Icon(
          icon,
          size: 30,
          color: grey,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      onSaved: onSaved,
      validator: validator,
    );
  }
}
