import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';

import 'degree_card.dart';

class DegreesViewBody extends StatelessWidget {
  DegreesViewBody({
    super.key,
  });
  final List<Map<String, dynamic>> subjects = [
    {
      'name': 'Arabic',
      'practical': '18/20',
      'midterm': '28/30',
      'final': '48/50'
    },
    {
      'name': 'Math',
      'practical': '18/20',
      'midterm': '28/30',
      'final': '48/50'
    },
    {
      'name': 'English',
      'practical': '18/20',
      'midterm': '28/30',
      'final': '48/50'
    },
    {
      'name': 'Science',
      'practical': '18/20',
      'midterm': '28/30',
      'final': '48/50'
    },
    {
      'name': 'Social Studies',
      'practical': '18/20',
      'midterm': '28/30',
      'final': '48/50'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Degrees'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            return DegreeCard(subject: subjects[index]);
          },
        ),
      ),
    );
  }
}
