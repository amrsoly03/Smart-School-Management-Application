import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/models/order_model.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Features/Parent/presentation/manager/parent_cubit/parent_cubit.dart';

import '../../../../../Core/utils/app_router.dart';

class PreviousTransactionCard extends StatelessWidget {
  const PreviousTransactionCard({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    ParentCubit parentCubit = BlocProvider.of<ParentCubit>(context);

    return GestureDetector(
      onTap: () {
        parentCubit.viewOrderProducts(op_order: orderModel.orderId.toString());
        GoRouter.of(context).push(
          AppRouter.kOrderProductsView,
          extra: true,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '${orderModel.totalPrice} EGP',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'By ${orderModel.orderStudent}',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Center(
              child: Text(
                'Date: ${orderModel.date!}',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
