import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Features/Student/presentation/views/widgets/school_activities_view_body.dart';

import '../../../../../Core/utils/theme.dart';
import '../../../../../Core/widgets/category_button.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'categories'),
      body: Container(
        color: Colors.blueGrey[100],
        child: Center(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: darkBlue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
        ],
      ),
    );
  }
}
