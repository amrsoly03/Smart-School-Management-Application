import 'package:flutter/material.dart';
import 'package:nexura/Core/models/order_model.dart';
import 'package:nexura/Core/utils/theme.dart';

class PreviousTransactionCard extends StatelessWidget {
  const PreviousTransactionCard({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: darkBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              '${orderModel.totalPrice} EGP',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'By ${orderModel.orderStudent}',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),

          Center(
            child: Text(
              'Date: ${orderModel.date!}',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
