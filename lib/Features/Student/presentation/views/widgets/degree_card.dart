import 'package:flutter/material.dart';

import '../../../../../Core/utils/theme.dart';

class DegreeCard extends StatelessWidget {
  final Map<String, dynamic> subject;

  const DegreeCard({super.key, required this.subject});

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
              subject["name"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              "Practical: ${subject["practical"]}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              "Midterm: ${subject["midterm"]}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              "Final: ${subject["final"]}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
