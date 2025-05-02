import 'package:flutter/material.dart';
import 'package:nexura/Core/utils/theme.dart';

class PreviousTransactionCard extends StatelessWidget {
  final String amount;
  final String by;
  final String method;
  final String dateTime;

  const PreviousTransactionCard({
    super.key,
    required this.amount,
    required this.by,
    required this.method,
    required this.dateTime,
  });

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
              amount,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'By $by',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              method,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              dateTime,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}