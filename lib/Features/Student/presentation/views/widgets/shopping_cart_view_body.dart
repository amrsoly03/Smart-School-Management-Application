import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Core/widgets/custom_button.dart';
import 'package:nexura/Features/Student/presentation/views/widgets/cart_product_card.dart';

class ShoppingCartViewBody extends StatelessWidget {
  const ShoppingCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Shopping Cart'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CartProductCard(
            name: 'chocolate bar',
            price: 10,
            image: 'assets/chocolate_bar.jpg',
          ),
          const CartProductCard(
            name: 'pancakes',
            price: 25,
            image: 'assets/pancakes.jpg',
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 50,
              child: CustomButton(title: 'Checkout', function: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
