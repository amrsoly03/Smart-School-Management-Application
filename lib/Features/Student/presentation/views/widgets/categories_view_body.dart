import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';

import '../../../../../Core/widgets/category_button.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'categories'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: const [
              CategoryButton(title: 'Snacks'),
              CategoryButton(title: 'Meals'),
              CategoryButton(title: 'Desserts'),
              CategoryButton(title: 'Drinks'),
            ],
          ),
        ),
      ),
    );
  }
}
