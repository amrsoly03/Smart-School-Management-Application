import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Features/Admin/presentation/manager/models_cubit/models_cubit.dart';
import 'package:nexura/Features/Student/presentation/views/widgets/product_card.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: category),
      body: BlocBuilder<ModelsCubit, ModelsState>(
        builder: (context, state) {
          if (state is ModelsFailure) {
            return Center(child: Text(state.errMessage));
          } else if (state is ProductsSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ProductCard(
                  productModel: state.products[index],
                );
              },
              itemCount: state.products.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: darkBlue,
              ),
            );
          }
        },
      ),
    );
  }
}
