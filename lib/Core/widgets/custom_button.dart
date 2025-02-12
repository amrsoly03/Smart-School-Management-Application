import 'package:flutter/material.dart';
import 'package:nexura/Core/utils/styles.dart';

import '../functions/capitalize.dart';
import '../utils/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.function, required this.title});

  final Function()? function;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: darkBlue,
          foregroundColor: white,
          fixedSize: const Size.fromHeight(60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(capitalize(title), style: Styles.textStyle18),
      ),
    );
  }
}
