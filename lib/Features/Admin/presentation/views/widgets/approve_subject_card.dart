import 'package:flutter/material.dart';

import '../../../../../Core/functions/capitalize.dart';
import '../../../../../Core/models/subject_model.dart';
import '../../../../../Core/utils/theme.dart';
import 'custom_approve_button.dart';

class ApproveSubjectCard extends StatelessWidget {
  const ApproveSubjectCard({
    super.key,
    required this.subject,
  });

  final SubjectModel subject;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: darkBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            capitalize("Student ID : ${subject.asStudentId}"),
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            capitalize("Student name : ${subject.asStudent}"),
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            capitalize("Subject : ${subject.asSubject}"),
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CustomApproveButton(
              as_id: subject.asId.toString(),
            ),
          )
        ],
      ),
    );
  }
}
