import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appbar_two.dart';

import 'previous_transaction_card.dart';

class PreviousTransactionViewBody extends StatelessWidget {
  const PreviousTransactionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppbarTwo(
          title: 'Previous Transaction',
        ),
        body: Padding(
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


