import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Core/widgets/custom_button.dart';
import 'package:nexura/Core/widgets/custom_form_field.dart';
import 'package:nexura/Core/widgets/custom_snackbar.dart';
import 'package:nexura/Features/Parent/presentation/manager/parent_cubit/parent_cubit.dart';

import '../../../../../Core/widgets/custom_appBar.dart';
import 'custom_drawer.dart';

class ChargeCoinsViewBody extends StatelessWidget {
  ChargeCoinsViewBody({super.key});

  final TextEditingController coinsController = TextEditingController();
  final TextEditingController parentIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ParentCubit parentCubit = BlocProvider.of<ParentCubit>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'charge coins'),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "charge coins",
              style: Styles.textStyle20.copyWith(
                color: darkBlue,
              ),
            ),
            // Row(
            //   children: [
            //     ProcessButton(
            //       title: 'coins charging',
            //       color: darkBlue,
            //       function: () {
            //         //GoRouter.of(context).pushReplacement('/payment/charge');
            //       },
            //     ),
            //     const SizedBox(width: 10),
            //     ProcessButton(
            //       title: 'pay expenses',
            //       color: grey,
            //       function: () {
            //         feesCubit.viewFees();
            //         GoRouter.of(context)
            //             .pushReplacement(AppRouter.kPayFeesView);
            //       },
            //     ),
            //   ],
            // ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: Column(
                  children: [
                    CustomFormField(
                      labelText: 'enter parent id',
                      controller: parentIdController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    CustomFormField(
                      labelText: 'enter the amount',
                      controller: coinsController,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            BlocConsumer<ParentCubit, ParentState>(
              listener: (context, state) {
                if (state is ParentFailure) {
                  kShowSnackBar(context, state.errMessage);
                } else if (state is ChargeCoinsSuccess) {
                  kShowSnackBar(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is ParentLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: darkBlue,
                    ),
                  );
                } else {
                  return Row(
                    children: [
                      CustomButton(
                        title: 'complete the process',
                        function: () {
                          if (coinsController.text.isEmpty) {
                            return kShowSnackBar(
                                context, 'Please enter amount first');
                          } else {
                            parentCubit.chargeCoins(
                              increase_by: coinsController.text,
                              parent_id: parentIdController.text,
                            );
                          }
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
