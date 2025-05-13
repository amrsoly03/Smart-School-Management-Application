import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/app_router.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Features/Student/presentation/views/widgets/custom_container.dart';

class StudentHomeViewBody extends StatelessWidget {
  const StudentHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'home'),
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
