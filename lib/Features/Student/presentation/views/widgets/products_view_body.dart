import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Features/Student/presentation/views/widgets/product_card.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Meals'),
      body: Column(
        children: [
          ProductCard(
            name: 'chocolate bar',
            price: 10,
            image: 'assets/chocolate_bar.jpg',
          ),
          ProductCard(
            name: 'pancakes',
            price: 25,
            image: 'assets/pancakes.jpg',
          ),
        ],
      ),
    );
  }
}
