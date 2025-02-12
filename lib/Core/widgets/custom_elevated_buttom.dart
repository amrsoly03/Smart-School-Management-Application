import 'package:flutter/material.dart';
import 'package:nexura/Core/utils/size_config.dart';
import 'package:nexura/Core/utils/styles.dart';

import '../utils/theme.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
  });

  final String label;
  final icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(label, style: Styles.textStyle18.copyWith(color: white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: darkBlue,
        foregroundColor: white,
        fixedSize:  Size(SizeConfig.screenWidth, 40),
        padding: const EdgeInsets.symmetric(horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
