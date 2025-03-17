import 'package:flutter/material.dart';
import 'package:nexura/Core/functions/capitalize.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/utils/theme.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.product,
    required this.productType,
    required this.price,
  });

  final String product;
  final String productType;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: darkBlue,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    capitalize(product),
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20.copyWith(
                      fontSize: 22,
                    ),
                  ),
                ),
                Text(
                  capitalize(productType),
                  style: Styles.textStyle18,
                ),
              ],
            ),
            Text(
              '$price EGP',
              style: Styles.textStyle20,
            ),
          ],
        ),
      ),
    );
  }
}
