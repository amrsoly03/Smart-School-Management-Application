import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/app_router.dart';

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
      onPressed: () {
        GoRouter.of(context).push(AppRouter.kProductsView);
      },
      child: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}
