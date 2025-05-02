import 'package:flutter/material.dart';
import 'package:nexura/Core/utils/theme.dart';

import '../../../../../Core/utils/styles.dart';

class ProcessButton extends StatelessWidget {
  const ProcessButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    //const bool isSelected = true;
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          //backgroundColor: isSelected ? darkBlue : Colors.white,
          //foregroundColor: isSelected ? Colors.white : darkBlue,
          side: const BorderSide(color: darkBlue),
        ),
        onPressed: () {},
        child: Text(
          title,
          style: Styles.textStyle16,
        ),
      ),
    );
  }
}
