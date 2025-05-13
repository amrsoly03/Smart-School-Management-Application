import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Features/Student/presentation/views/categories_view.dart';
import 'package:nexura/Features/Student/presentation/views/shopping_cart_view.dart';

class CafeteriaView extends StatefulWidget {
  const CafeteriaView({super.key});

  @override
  State<CafeteriaView> createState() => _CafeteriaViewState();
}

class _CafeteriaViewState extends State<CafeteriaView> {
  int current_index = 0;
  List pages = [
    const CategoriesView(),
    const ShoppingCartView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[current_index],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: CustomNavigationBar(
          currentIndex: current_index,
          backgroundColor: darkBlue,
          iconSize: 32,
          isFloating: true,
          borderRadius: const Radius.circular(15),
          selectedColor: white,
          strokeColor: white,
          onTap: (index) {
            setState(() => current_index = index);
          },
          items: [
            CustomNavigationBarItem(
              icon: const Icon(Icons.food_bank_outlined),
              title: const Text('Categories'),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart_outlined),
              title: const Text('shopping cart'),
            ),
          ],
        ),
      ),
    );
  }
}
