import 'package:flutter/material.dart';
import 'package:nexura/Features/Student/presentation/views/widgets/student_page.dart';

import '../../../../../Core/utils/theme.dart';
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
      appBar: AppBar(
        backgroundColor: darkBlue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const QuizzesAndDegreesViewBody();
            }));
          },
        ),
        title: const Text(
          "Degrees",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey[100], // Light background
      body: Padding(
        padding: const EdgeInsets.all(5),
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

