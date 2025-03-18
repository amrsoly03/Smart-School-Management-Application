import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';

class ScheduleViewBody extends StatelessWidget {
  const ScheduleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Schedule'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/schedule.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
