import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Features/Parent/presentation/manager/parent_cubit/parent_cubit.dart';
import 'package:nexura/Features/Student/presentation/manager/student_cubit/student_cubit.dart';
import 'package:nexura/main.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/widgets/custom_appBar.dart';
import '../../../../Admin/presentation/views/widgets/admins_home_button.dart';

class StudentFollowUpViewBody extends StatelessWidget {
  const StudentFollowUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    StudentCubit studentCubit = BlocProvider.of<StudentCubit>(context);
    ParentCubit parentCubit = BlocProvider.of<ParentCubit>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'student follow up'),
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
                title: 'Approve Orders',
                onPressed: () {
                  parentCubit.viewPreviousTransactions(
                    order_student: sharedPref.getString('student_id')!,
                    order_approved: '0',
                  );
                  GoRouter.of(context).push(AppRouter.kApproveOrdersView);
                },
              ),
              AdminsHomeButton(
                title: 'Approve Activity Subscription',
                onPressed: () {
                  //GoRouter.of(context).push(AppRouter.kLoginView);
                },
              ),
              AdminsHomeButton(
                title: 'View Student Degrees',
                onPressed: () {
                  studentCubit.viewDegrees(
                    std_degree: sharedPref.getString('student_id')!,
                  );
                  GoRouter.of(context).push(AppRouter.kDegreesView);
                },
              ),
              AdminsHomeButton(
                title: 'View Student Schedule',
                onPressed: () {
                  studentCubit.viewSchedule(student_id: sharedPref.getString('student_id')!);
                  GoRouter.of(context).push(AppRouter.kScheduleView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
