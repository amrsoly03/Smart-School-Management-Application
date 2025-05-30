import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Features/Parent/presentation/manager/parent_cubit/parent_cubit.dart';
import 'package:nexura/main.dart';

import '../../../../../Core/utils/theme.dart';
import '../../../../../Core/widgets/custom_appBar.dart';
import 'order_product_card.dart';

class OrderProductsViewBody extends StatelessWidget {
  const OrderProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    ParentCubit parentCubit = BlocProvider.of<ParentCubit>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'transaction products',
        anotherFunction: () {
          parentCubit.viewPreviousTransactions(
            order_student: sharedPref.getString('student_id')!,
            order_approved: '1',
          );
        },
      ),
      body: BlocBuilder<ParentCubit, ParentState>(
        builder: (context, state) {
          if (state is ParentFailure) {
            return Center(child: Text(state.errMessage));
          } else if (state is ViewOrderProductsSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return OrderProductCard(
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
