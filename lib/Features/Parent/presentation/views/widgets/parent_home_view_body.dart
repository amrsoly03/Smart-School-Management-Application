import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';

import 'custom_rounded_button.dart';

class ParentHomeViewBody extends StatelessWidget {
  const ParentHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Parent Home'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomRoundedButton(
              text: "Student Follow up",
              icon: Icons.person,
            ),
            SizedBox(height: 40),
            CustomRoundedButton(
              text: "Wallet Management",
              icon: Icons.wallet_sharp,
            ),
            SizedBox(height: 40),
            CustomRoundedButton(
              text: "Report & Notification",
              icon: Icons.notifications_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
