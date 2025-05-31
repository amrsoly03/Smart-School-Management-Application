import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/models/order_model.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Features/Parent/presentation/manager/parent_cubit/parent_cubit.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/utils/styles.dart';

class ApproveOrderCard extends StatelessWidget {
  const ApproveOrderCard({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    ParentCubit parentCubit = BlocProvider.of<ParentCubit>(context);

    return BlocConsumer<ParentCubit, ParentState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        if (state is ParentLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: darkBlue,
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              parentCubit.viewOrderProducts(
                  op_order: orderModel.orderId.toString());
              GoRouter.of(context).push(
                AppRouter.kOrderProductsView,
                extra: false,
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
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        parentCubit.approveOrder(
                          order_id: orderModel.orderId.toString(),
                          total_price: orderModel.totalPrice.toString(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: background,
                      ),
                      child: Text(
                        'Approve',
                        style: Styles.textStyle16.copyWith(
                          color: darkBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
