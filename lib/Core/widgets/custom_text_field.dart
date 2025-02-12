import 'package:flutter/material.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/utils/theme.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.validatorTitle,
    required this.controller,
    this.onChanged,
  });

  final String label;
  final String validatorTitle;
  final TextEditingController controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Styles.textStyle18,
      decoration: InputDecoration(
        labelText: label,
        fillColor: darkBlue,
        filled: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/icons/dumbbell.png',
              width: 10, color: darkBlue),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return validatorTitle;
        }
        return null;
      },
    );
  }
}
