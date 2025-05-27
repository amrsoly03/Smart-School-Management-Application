import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/widgets/custom_appBar.dart';
import '../../../../../first_screen.dart';
import 'admins_home_button.dart';

class AdminsHomeViewBody extends StatelessWidget {
  const AdminsHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'categories'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              AdminsHomeButton(
                title: 'School Admin',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kLoginView, extra: Users.schoolAdmin);
                },
              ),
              AdminsHomeButton(
                title: 'Cafeteria Admin',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kLoginView, extra: Users.cafeteriaAdmin);
                },
              ),
              AdminsHomeButton(
                title: 'Activities Admin',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kLoginView, extra: Users.activitiesAdmin);
                },
              ),
              AdminsHomeButton(
                title: 'Teacher',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kLoginView, extra: Users.teacher);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
