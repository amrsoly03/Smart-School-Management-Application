import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/widgets/custom_appBar.dart';
import '../../../../Parent/presentation/views/widgets/custom_rounded_button.dart';

class CafeteriaAdminHomeViewBody extends StatelessWidget {
  const CafeteriaAdminHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cafeteria Admin Home'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomRoundedButton(
              text: "Add Product",
              icon: Icons.add_circle_outline,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kAddProductView);
              },
            ),
            const SizedBox(height: 40),
            CustomRoundedButton(
              text: "View Previous Orders",
              icon: Icons.history,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kPreviousTransactionView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
