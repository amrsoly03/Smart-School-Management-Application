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

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _animation =
        Tween<double>(begin: 1, end: 0.9).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ModelsCubit modelsCubit = BlocProvider.of<ModelsCubit>(context);

    return GestureDetector(
      onTap: () {
        modelsCubit.addToShoppingCart(widget.productModel, context);
        _animationController.forward().then((value) {
          _animationController.reverse();
        });
      },
      child: ScaleTransition(
        scale: _animation,
        child: Card(
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
                      capitalize(widget.productModel.productName!),
                      style: Styles.textStyle18,
                    ),
                    Text(
                      capitalize('price: ${widget.productModel.productPrice}'),
                      style: Styles.textStyle16,
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                        '${Links.linkUploadProducts}/${widget.productModel.productImage}',
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
        ),
      ),
    );
  }
}
