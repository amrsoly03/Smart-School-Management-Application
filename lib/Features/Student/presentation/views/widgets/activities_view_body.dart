import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/app_router.dart';

import '../../../../../Core/widgets/custom_appBar.dart';
import 'custom_container.dart';

class ActivitiesViewBody extends StatelessWidget {
  const ActivitiesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'activities'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomContainer(
              title: 'football',
              image: 'assets/football.jpg',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kActivityDetailsView);
              },
            ),
            CustomContainer(
              title: 'padel',
              image: 'assets/padel.jpg',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kActivityDetailsView);
              },
            ),
            CustomContainer(
              title: 'basketball',
              image: 'assets/basketball.jpg',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kActivityDetailsView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
