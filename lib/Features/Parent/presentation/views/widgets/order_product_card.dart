import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nexura/Core/models/product_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Core/functions/capitalize.dart';
import '../../../../../Core/utils/links.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/utils/theme.dart';

class OrderProductCard extends StatelessWidget {
  const OrderProductCard({super.key, required this.productModel});

  final ProductModel productModel;

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
                  capitalize(productModel.productName!),
                  style: Styles.textStyle18,
                ),
                Text(
                  capitalize('price: ${productModel.productPrice}'),
                  style: Styles.textStyle16,
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl:
                    '${Links.linkUploadProducts}/${productModel.productImage}',
                height: 100,
                width: 130,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: darkBlue.withOpacity(0.5),
                  highlightColor: darkBlue,
                  child: Container(
                    color: darkBlue,
                    width: 130,
                    height: 100,
                  ),
                ),
                errorWidget: (context, url, error) {
                  log('Error loading image: $error');
                  return const Icon(Icons.error);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
