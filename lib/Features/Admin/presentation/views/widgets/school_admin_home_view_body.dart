import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu/modals.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Features/Admin/presentation/manager/admin_cubit/admin_cubit.dart';
import 'package:nexura/Features/Admin/presentation/manager/models_cubit/models_cubit.dart';
import 'package:nexura/Features/Admin/presentation/manager/questions_cubit/questions_cubit.dart';

import '../../../../../Core/functions/capitalize.dart';
import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/utils/size_config.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/utils/theme.dart';
import 'admin_home_container.dart';

class SchoolAdminHomeViewBody extends StatelessWidget {
  const SchoolAdminHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    ModelsCubit modelsCubit = BlocProvider.of<ModelsCubit>(context);
    AdminCubit adminCubit = BlocProvider.of<AdminCubit>(context);
    QuestionsCubit questionsCubit = BlocProvider.of<QuestionsCubit>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Home'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AdminHomeContainer(
                title: 'manage users',
                menuItems: [
                  FocusedMenuItem(
                    title: Text(
                      capitalize('add user'),
                      style: Styles.textStyle18,
                    ),
                    trailingIcon: const Icon(Icons.add),
                    backgroundColor: darkBlue,
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kCreateAccountView);
                    },
                  ),
                  FocusedMenuItem(
                    title: Text(
                      capitalize('edit user'),
                      style: Styles.textStyle18,
                    ),
                    trailingIcon: const Icon(Icons.edit),
                    backgroundColor: darkBlue,
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kEditUserView);
                    },
                  ),
                ],
              ),
              AdminHomeContainer(
                title: 'subject features',
                menuItems: [
                  FocusedMenuItem(
                    title: Text(
                      capitalize('approve subject'),
                      style: Styles.textStyle18,
                    ),
                    trailingIcon: const Icon(Icons.check),
                    backgroundColor: darkBlue,
                    onPressed: () {
                      modelsCubit.viewApprovmentSubjects();
                      GoRouter.of(context).push(AppRouter.kApproveSubjectView);
                    },
                  ),
                  FocusedMenuItem(
                    title: Text(
                      capitalize('set degrees'),
                      style: Styles.textStyle18,
                    ),
                    trailingIcon: const Icon(Icons.edit_document),
                    backgroundColor: darkBlue,
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kAddDegreeView);
                    },
                  ),
                  FocusedMenuItem(
                    title: Text(
                      capitalize('add exam'),
                      style: Styles.textStyle18,
                    ),
                    trailingIcon: const Icon(Icons.add),
                    backgroundColor: darkBlue,
                    onPressed: () {
                      questionsCubit.resetQuestions();
                      GoRouter.of(context).push(AppRouter.kAddExamView);
                    },
                  ),
                ],
              ),
              AdminHomeContainer(
                title: 'reports',
                menuItems: [
                  FocusedMenuItem(
                    title: Text(
                      capitalize('send report'),
                      style: Styles.textStyle18,
                    ),
                    trailingIcon: const Icon(Icons.send),
                    backgroundColor: darkBlue,
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kSendReportView);
                    },
                  ),
                  FocusedMenuItem(
                    title: Text(
                      capitalize('view sent reports'),
                      style: Styles.textStyle18,
                    ),
                    trailingIcon: const Icon(Icons.mail_outline),
                    backgroundColor: darkBlue,
                    onPressed: () {
                      adminCubit.viewAdminSentReports();
                      GoRouter.of(context).push(AppRouter.kSentReportsView);
                    },
                  ),
                  FocusedMenuItem(
                    title: Text(
                      capitalize('activities notifications'),
                      style: Styles.textStyle18,
                    ),
                    trailingIcon: const Icon(Icons.notifications_outlined),
                    backgroundColor: darkBlue,
                    onPressed: () {
                      GoRouter.of(context).push(
                        AppRouter.kActivitiesNotificationView,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
