import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/functions/capitalize.dart';
import 'package:nexura/Core/utils/app_router.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Core/widgets/custom_button.dart';
import 'package:nexura/Core/widgets/custom_snackbar.dart';
import 'package:nexura/Features/Parent/presentation/manager/fees_cubit/fees_cubit.dart';
import 'package:nexura/Features/Parent/presentation/manager/parent_cubit/parent_cubit.dart';

import '../../../../../Core/widgets/custom_appBar.dart';
import 'custom_drawer.dart';
import 'process_button.dart';

class PayFeesViewBody extends StatelessWidget {
  const PayFeesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    ParentCubit parentCubit = BlocProvider.of<ParentCubit>(context);
    FeesCubit feesCubit = BlocProvider.of<FeesCubit>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select The Process",
              style: Styles.textStyle20.copyWith(
                color: darkBlue,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ProcessButton(
                  title: 'coins charging',
                  color: grey,
                  function: () {
                    GoRouter.of(context)
                        .pushReplacement(AppRouter.kChargeCoinsView);
                  },
                ),
                const SizedBox(width: 10),
                ProcessButton(
                  title: 'pay expenses',
                  color: darkBlue,
                  function: () {},
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: BlocBuilder<FeesCubit, FeesState>(
                builder: (context, state) {
                  if (state is FeesFailure) {
                    return Center(
                      child: Text(
                        state.errMessage,
                        style: Styles.textStyle25.copyWith(color: darkBlue),
                      ),
                    );
                  } else if (state is FeesDone) {
                    return Center(
                      child: Text(
                        state.message,
                        style: Styles.textStyle25.copyWith(color: darkBlue),
                      ),
                    );
                  } else if (state is ViewFeesSuccess) {
                    return Column(
                      children: [
                        Text(
                          capitalize('your fees: ${state.fees}'),
                          style: Styles.textStyle25.copyWith(color: darkBlue),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            BlocListener<ParentCubit, ParentState>(
                              listener: (context, state) {
                                if (state is ParentFailure) {
                                  kShowSnackBar(context, state.errMessage);
                                } else if (state is PayFeesSuccess) {
                                  kShowSnackBar(context, state.message);
                                  feesCubit.feesDone(message: 'fees paid successfully');
                                }
                              },
                              child: CustomButton(
                                title: 'complete the process',
                                function: () {
                                  parentCubit.payFees();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
