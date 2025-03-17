import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Features/Parent/presentation/views/widgets/transaction_card.dart';

class TransactionsDetailsViewBody extends StatelessWidget {
  const TransactionsDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Transactions Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              TransactionCard(
                product: 'chips',
                productType: 'cafeteria',
                price: 10,
              ),
              TransactionCard(
                product: 'football training',
                productType: 'sports activities',
                price: 500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
