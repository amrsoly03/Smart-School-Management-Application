import 'package:flutter/material.dart';
import 'package:nexura/Core/functions/capitalize.dart';
import 'package:nexura/Core/utils/theme.dart';

import '../../../../../Core/utils/styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.name, required this.price, required this.image});

  final String name;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: darkBlue,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
    );
  }
}
