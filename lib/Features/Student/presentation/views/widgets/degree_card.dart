import 'package:flutter/material.dart';
import 'package:nexura/Core/models/degree_model.dart';

import '../../../../../Core/utils/theme.dart';

class DegreeCard extends StatelessWidget {
  const DegreeCard({super.key, required this.degreeModel});

  final DegreeModel degreeModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: darkBlue, // Dark blue background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              degreeModel.subjectDegreeName!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            const SizedBox(height: 10),
            Text(
              "Practical: ${degreeModel.practical}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              "Midterm: ${degreeModel.mid}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              "Final: ${degreeModel.finalDegree}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
