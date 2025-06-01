import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/widgets/home_appbar.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../Parent/presentation/views/widgets/custom_rounded_button.dart';
import '../../manager/questions_cubit/questions_cubit.dart';

class TeacherHomeViewBody extends StatelessWidget {
  const TeacherHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionsCubit questionsCubit = BlocProvider.of<QuestionsCubit>(context);

    return Scaffold(
      appBar: const HomeAppbar(title: 'Teacher Home'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomRoundedButton(
              text: "Add Quiz",
              icon: Icons.add_circle_outline,
              onTap: () {
                questionsCubit.resetQuestions();
                GoRouter.of(context).push(AppRouter.kAddExamView);
              },
            ),
            const SizedBox(height: 40),
            CustomRoundedButton(
              text: "Set Degrees",
              icon: Icons.edit_document,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kAddDegreeView);
              },
            ),
            // CustomRoundedButton(
            //   text: "Approve Subject",
            //   icon: Icons.edit_document,
            //   onTap: () {
            //     modelsCubit.viewApprovmentSubjects();
            //     GoRouter.of(context).push(AppRouter.kApproveSubjectView);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
