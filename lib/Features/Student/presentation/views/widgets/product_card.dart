import 'package:flutter/material.dart';
import 'package:nexura/Core/functions/capitalize.dart';
import 'package:nexura/Core/utils/theme.dart';

import '../../../../../Core/utils/styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: darkBlue,
      margin: EdgeInsets.all(15),
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
                  capitalize('chocolate bar'),
                  style: Styles.textStyle18.copyWith(color: Colors.white),
                ),
                Text(
                  capitalize('price: 50'),
                  style: Styles.textStyle16.copyWith(color: Colors.white),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/chocolate_bar.jpg',
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
