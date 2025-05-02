import 'package:flutter/material.dart';

import '../utils/theme.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  const CategoryButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {},
      child: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}
