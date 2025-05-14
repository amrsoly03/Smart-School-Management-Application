import 'package:flutter/material.dart';
import 'package:nexura/Core/utils/styles.dart';

import '../utils/theme.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.labelText,
    this.onSaved,
    this.validator,
    this.icon,
    required this.controller,
    required this.keyboardType,
  });

  final String labelText;
  final IconData? icon;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Styles.textStyle18.copyWith(color: black),
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: white,
        filled: true,
        labelStyle: Styles.textStyle18.copyWith(color: grey.withOpacity(0.5)),
        errorStyle: Styles.textStyle16.copyWith(
          color: const Color.fromARGB(255, 110, 7, 0),
        ),
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
