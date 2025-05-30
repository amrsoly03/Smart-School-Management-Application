import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/main.dart';

import '../../../../../Core/widgets/custom_appBar.dart';
import '../../manager/parent_cubit/parent_cubit.dart';
import 'custom_drawer.dart';

class WalletDetailsViewBody extends StatelessWidget {
  const WalletDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Your Wallet',
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
      body: Center(
        child: BlocBuilder<ParentCubit, ParentState>(
          builder: (context, state) {
            if (state is ParentFailure) {
              return Center(
                child: Text(
                  state.errMessage,
                  style: Styles.textStyle20.copyWith(color: darkBlue),
                ),
              );
            } else if (state is ViewCoinsSuccess) {
              return Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: darkBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Name : ${sharedPref.getString('student_name')}",
                      style: Styles.textStyle25,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "ID : ${sharedPref.getString('student_id')}",
                      style: Styles.textStyle25,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Balance : ${state.coins} coins",
                      style: Styles.textStyle25.copyWith(
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: darkBlue,
              ));
            }
          },
        ),
      ),
    );
  }
}
