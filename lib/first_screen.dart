import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/app_router.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';

import 'Core/widgets/custom_button.dart';

enum Users {
  schoolAdmin,
  cafeteriaAdmin,
  activitiesAdmin,
  teacher,
  parent,
  student,
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'SSMA',
        canPop: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                title: 'Admin',
                function: () {
                  GoRouter.of(context).push(AppRouter.kAdminsHomeView);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: 'Student',
                function: () {
                  GoRouter.of(context)
                      .push(AppRouter.kLoginView, extra: Users.student);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: 'Parent',
                function: () {
                  GoRouter.of(context)
                      .push(AppRouter.kLoginView, extra: Users.parent);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
