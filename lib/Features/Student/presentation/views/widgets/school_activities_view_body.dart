import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Features/Student/presentation/manager/student_cubit/student_cubit.dart';
import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/widgets/custom_button.dart';

class SchoolActivitiesViewBody extends StatelessWidget {
  const SchoolActivitiesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    StudentCubit studentCubit = BlocProvider.of<StudentCubit>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'school activities'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                title: 'Quizzes',
                function: () {
                  GoRouter.of(context).push(AppRouter.kQuizzesView);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                title: 'Degrees',
                function: () {
                  studentCubit.viewDegrees();
                  GoRouter.of(context).push(AppRouter.kDegreesView);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                title: 'Schedule',
                function: () {
                  studentCubit.viewSchedule();
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
