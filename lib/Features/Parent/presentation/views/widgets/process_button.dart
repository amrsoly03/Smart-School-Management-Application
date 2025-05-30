import 'package:flutter/material.dart';
import 'package:nexura/Core/utils/theme.dart';

import '../../../../../Core/utils/styles.dart';

class ProcessButton extends StatelessWidget {
  const ProcessButton({
    super.key,
    required this.title,
    required this.function,
    required this.color,
  });

  final String title;
  final Function() function;
  final Color color;

  @override
  Widget build(BuildContext context) {
    //const bool isSelected = true;
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          side: const BorderSide(color: darkBlue),
        ),
        onPressed: function,
        child: Text(
          title,
          style: Styles.textStyle16,
        ),
      ),
    );
  }
}
