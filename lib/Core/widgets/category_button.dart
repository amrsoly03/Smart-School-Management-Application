import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/functions/capitalize.dart';
import 'package:nexura/Core/utils/app_router.dart';
import 'package:nexura/Features/Admin/presentation/manager/models_cubit/models_cubit.dart';

import '../utils/theme.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    ModelsCubit modelsCubit = BlocProvider.of<ModelsCubit>(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {
        modelsCubit.viewProducts(product_category: category);
        GoRouter.of(context).push(AppRouter.kProductsView, extra: category);
      },
      child: Text(
        capitalize(category),
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
