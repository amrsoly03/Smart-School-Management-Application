import 'package:flutter/material.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Core/widgets/custom_button.dart';

import '../../../../../Core/widgets/custom_appBar.dart';
import 'custom_drawer.dart';
import 'process_button.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Row(
              children: [
                ProcessButton(
                  title: 'pay expenses',
                ),
                SizedBox(width: 10),
                ProcessButton(
                  title: 'wallet charging',
                ),
              ],
            ),
            const SizedBox(height: 30),
            walletInfo(
              "Money",
              "10,000 EGP",
            ),
            walletInfo("Expenses", "5,000 EGP"),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                title: 'complete the process',
                function: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget walletInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Styles.textStyle20.copyWith(
              color: darkBlue,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: Styles.textStyle25.copyWith(
              color: darkBlue,
            ),
          ),
        ],
      ),
    );
  }
}
