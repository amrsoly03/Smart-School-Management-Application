import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/widgets/custom_appBar.dart';
import '../../../../Parent/presentation/views/widgets/custom_rounded_button.dart';

class ActivitiesAdminHomeViewBody extends StatelessWidget {
  const ActivitiesAdminHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Activities Admin Home'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomRoundedButton(
              text: "Add Activity",
              icon: Icons.add_circle_outline,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kAddExamView);
              },
            ),
            const SizedBox(height: 40),
            CustomRoundedButton(
              text: "Send Activity Notification",
              icon: Icons.notifications_outlined,
              onTap: () {
                GoRouter.of(context)
                    .push(AppRouter.kActivitiesNotificationView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
