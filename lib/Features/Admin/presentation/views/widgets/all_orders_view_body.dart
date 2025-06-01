import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Features/Admin/presentation/manager/admin_cubit/admin_cubit.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/utils/theme.dart';
import '../../../../../Core/widgets/custom_appBar.dart';
import '../../../../Parent/presentation/views/widgets/custom_drawer.dart';
import '../../../../Parent/presentation/views/widgets/previous_transaction_card.dart';

class AllOrdersViewBody extends StatelessWidget {
  const AllOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Previous Orders'),
      drawer: const CustomDrawer(),
      body: BlocBuilder<AdminCubit, AdminState>(
        builder: (context, state) {
          if (state is AdminFailure) {
            return Center(
                child: Text(
              state.errMessage,
              style: Styles.textStyle20.copyWith(color: darkBlue),
            ));
          } else if (state is ViewAllOrdersSuccess) {
            return ListView.separated(
              padding: const EdgeInsets.all(12.0),
              itemCount: state.orders.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return PreviousTransactionCard(
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
