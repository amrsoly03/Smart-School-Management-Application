import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/app_router.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Features/Parent/presentation/manager/parent_cubit/parent_cubit.dart';
import 'package:nexura/main.dart';

import '../../../../../Core/widgets/custom_button.dart';

class NotificationsAndReportsViewBody extends StatelessWidget {
  const NotificationsAndReportsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ParentCubit parentCubit = BlocProvider.of<ParentCubit>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Notifications & Reports'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                title: 'Send Report',
                function: () {
                  GoRouter.of(context).push(AppRouter.kParentSendReportView);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                title: 'Sent Reports & Notifications',
                function: () {
                  parentCubit.viewParentSentReports(
                    std_report: sharedPref.getString('student_id')!,
                  );
                  GoRouter.of(context).push(AppRouter.kParentSentReportsView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
