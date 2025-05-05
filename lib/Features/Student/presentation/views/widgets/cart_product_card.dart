import 'package:flutter/material.dart';
import 'package:nexura/Core/functions/capitalize.dart';
import 'package:nexura/Core/utils/theme.dart';

import '../../../../../Core/utils/styles.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({super.key, required this.name, required this.price, required this.image});

  final String name;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(name),
      direction: DismissDirection.startToEnd,
      background: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.transparent,
        alignment: Alignment.centerLeft,
        child: const Icon(
          Icons.delete,
          color: Color.fromARGB(255, 190, 13, 0),
          size: 50,
        ),
      ),
      onDismissed: (direction) {
        // Handle the dismissal action here, e.g., remove the item from the cart
      },
      child: Card(
        color: darkBlue,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    capitalize(name),
                    style: Styles.textStyle18,
                  ),
                  Text(
                    capitalize('price: $price'),
                    style: Styles.textStyle16,
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 120,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
