import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/functions/capitalize.dart';
import 'package:nexura/Core/utils/app_router.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/utils/theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkBlue,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildMenuItem(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container();

  Widget buildMenuItem(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Wrap(
          runSpacing: 15,
          children: [
            ListTile(
              leading: const Icon(Icons.wallet),
              title: Text(
                capitalize('your wallet'),
                style: Styles.textStyle18,
              ),
              onTap: () {
                GoRouter.of(context)
                    .pushReplacement(AppRouter.kWalletDetailsView);
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: Text(
                capitalize('Payment'),
                style: Styles.textStyle18,
              ),
              onTap: () {
                GoRouter.of(context).pushReplacement(AppRouter.kPaymentView);
              },
            ),
            ListTile(
              leading: const Icon(Icons.storage_rounded),
              title: Text(
                capitalize('Previous Transactions'),
                style: Styles.textStyle18,
              ),
              onTap: () {
                GoRouter.of(context)
                    .pushReplacement(AppRouter.kPreviousTransactionView);
              },
            ),
          ],
        ),
      );
}
