import 'package:flutter/material.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/utils/theme.dart';

import '../../../../../Core/widgets/custom_appBar.dart';
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
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Name : Ahmed Mohamed",
                style: Styles.textStyle25,
              ),
              SizedBox(height: 8),
              Text(
                "ID : 2025033",
                style: Styles.textStyle25,
              ),
              SizedBox(height: 25),
              Text(
                "10,000 EGP",
                style: Styles.textStyle25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
