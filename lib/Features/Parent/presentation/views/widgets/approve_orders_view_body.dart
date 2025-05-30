import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Features/Parent/presentation/views/widgets/approve_order_card.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/utils/theme.dart';
import '../../../../../Core/widgets/custom_appBar.dart';
import '../../../../../Core/widgets/custom_snackbar.dart';
import '../../manager/parent_cubit/parent_cubit.dart';

class ApproveOrdersViewBody extends StatelessWidget {
  const ApproveOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Approve Orders'),
      body: BlocConsumer<ParentCubit, ParentState>(
        listener: (context, state) {
          if (state is ParentFailure) {
            kShowSnackBar(context, state.errMessage);
          } else if (state is ApproveOrderSuccess) {
            kShowSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is ParentFailure) {
            return Center(
                child: Text(
              state.errMessage,
              style: Styles.textStyle20.copyWith(color: darkBlue),
            ));
          } else if (state is ViewPreviousTransactionsSuccess) {
            return ListView.separated(
              padding: const EdgeInsets.all(12.0),
              itemCount: state.orders.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return ApproveOrderCard(
                  orderModel: state.orders[index],
                );
              },
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
