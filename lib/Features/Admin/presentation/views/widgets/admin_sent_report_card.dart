import 'package:flutter/material.dart';
import 'package:nexura/Core/utils/styles.dart';

import '../../../../../Core/functions/capitalize.dart';
import '../../../../../Core/utils/theme.dart';

class AdminSentReportCard extends StatelessWidget {
  const AdminSentReportCard({
    super.key,
    required this.senderName,
    required this.reportContent,
  });

  final String senderName;
  final String reportContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 350,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: darkBlue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              capitalize("From: $senderName"),
              style: Styles.textStyle20,
            ),
            const SizedBox(height: 5),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            const SizedBox(height: 5),
            Text(
              reportContent,
              style: Styles.textStyle18,
            ),
          ],
        ),
      ),
    );
  }
}
