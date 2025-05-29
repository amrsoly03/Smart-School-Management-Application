import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/functions/capitalize.dart';
import 'package:nexura/Core/models/product_model.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Features/Admin/presentation/manager/models_cubit/models_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Core/utils/links.dart';
import '../../../../../Core/utils/styles.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.productModel,
    required this.index,
  });

  final ProductModel productModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    ModelsCubit modelsCubit = BlocProvider.of<ModelsCubit>(context);

    return Dismissible(
      key: Key(index.toString()),
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
        modelsCubit.removeFromShoppingCart(productModel, context);
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
                      width: 120,
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
      ),
    );
  }
}
