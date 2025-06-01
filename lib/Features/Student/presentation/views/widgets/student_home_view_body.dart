import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/app_router.dart';
import 'package:nexura/Core/widgets/home_appbar.dart';
import 'package:nexura/Features/Student/presentation/views/widgets/custom_container.dart';

import '../../../../Admin/presentation/manager/models_cubit/models_cubit.dart';

class StudentHomeViewBody extends StatelessWidget {
  const StudentHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    ModelsCubit modelsCubit = BlocProvider.of<ModelsCubit>(context);

    return Scaffold(
      appBar: const HomeAppbar(title: 'home'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomContainer(
              title: 'school activities',
              image: 'assets/school activities.jpg',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kSchoolActivitiesView);
              },
            ),
            CustomContainer(
              title: 'sport activities',
              image: 'assets/sport activities.jpg',
              onTap: () {
                modelsCubit.viewActivities();
                GoRouter.of(context).push(AppRouter.kActivitiesView);
              },
            ),
            CustomContainer(
              title: 'school cafeteria',
              image: 'assets/school cafeteria.jpg',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kCafeteriaView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
