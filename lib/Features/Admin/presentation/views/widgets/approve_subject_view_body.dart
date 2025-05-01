import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';

class ApproveSubjectViewBody extends StatelessWidget {
  final List<Map<String, String>> subjects = [
    {
      "code": "2021201813",
      "name": "Ahmed",
      "subject": "French",
    },
    {
      "code": "2021201512",
      "name": "Omar",
      "subject": "German",
    },
    {
      "code": "2021201314",
      "name": "Ali",
      "subject": "Math",
    },
  ];

  ApproveSubjectViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD6E7EE),
      appBar: const CustomAppBar(title: 'Approve Subject'),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            final subject = subjects[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xff014479),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Student code : ${subject['code']}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Student name : ${subject['name']}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Subject : ${subject['subject']}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add logic to approve subject here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffD6E7EE),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                      ),
                      child: const Text("Save"),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
