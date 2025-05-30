import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Features/Parent/presentation/manager/parent_cubit/parent_cubit.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/utils/theme.dart';
import '../../../../../Core/widgets/custom_appBar.dart';
import 'custom_drawer.dart';
import 'previous_transaction_card.dart';

class PreviousTransactionViewBody extends StatelessWidget {
  const PreviousTransactionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Previous Transactions',
        actions: [
          Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        ],
      ),
      drawer: const CustomDrawer(),
      body: BlocBuilder<ParentCubit, ParentState>(
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
