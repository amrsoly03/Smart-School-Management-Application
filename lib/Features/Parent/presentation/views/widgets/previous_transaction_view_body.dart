import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appbar_two.dart';

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
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            PreviousTransactionCard(
              amount: '100 EGP',
              by: 'Student',
              method: 'Cash-on',
              dateTime: '09 feb 2025    2:30 PM',
            ),
            SizedBox(height: 16),
            PreviousTransactionCard(
              amount: '5,000 EGP',
              by: 'Parent',
              method: 'Cash-on',
              dateTime: '15 Apr 2025   10:00 AM',
            ),
          ],
        ),
      ),
    );
  }
}
