import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Features/Student/presentation/views/widgets/custom_container.dart';

class StudentHomeViewBody extends StatelessWidget {
  const StudentHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'home'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomContainer(
              title: 'school activities',
              image: 'assets/school activities.jpg',
            ),
            CustomContainer(
              title: 'sport activities',
              image: 'assets/sport activities.jpg',
            ),
            CustomContainer(
              title: 'school cafeteria',
              image: 'assets/school cafeteria.jpg',
            ),
          ],
        ),
      ),
    );
  }
}