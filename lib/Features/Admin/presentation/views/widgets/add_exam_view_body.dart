import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Core/widgets/custom_form_field.dart';

import 'question_card.dart';

// ignore: must_be_immutable
class AddExamViewBody extends StatelessWidget {
  AddExamViewBody({super.key});

  final TextEditingController examNameController = TextEditingController();

  String? selectedLevel;

  String? selectedSubject;

  List<String> levels = ['Level 1', 'Level 2', 'Level 3'];

  List<String> subjects = ['Math', 'Science', 'History'];

  List<Question> questions = [
    Question(questionText: 'Question 1'),
    Question(questionText: 'Question 2'),
  ];

  void addQuestion() {
    // setState(() {
    //   questions.add(Question(questionText: 'Question ${questions.length + 1}'));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD6E7EE),
      appBar: const CustomAppBar(title: 'Add Exam'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Exam Name
            CustomFormField(
              labelText: 'exam name',
              controller: examNameController,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 16),
            // Dropdowns
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedLevel,
                    onChanged: (val) {
                      //setState(() => selectedLevel = val);
                    },
                    items: levels.map((level) {
                      return DropdownMenuItem(
                        value: level,
                        child: Text(level,
                            style: const TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    dropdownColor: const Color(0xff014479),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff014479),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Select level',
                      hintStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedSubject,
                    onChanged: (val) {
                      //setState(() => selectedSubject = val);
                    },
                    items: subjects.map((subject) {
                      return DropdownMenuItem(
                        value: subject,
                        child: Text(subject,
                            style: const TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    dropdownColor: const Color(0xff014479),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff014479),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Select subject',
                      hintStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Question Cards
            ...questions.map((q) => QuestionCard(question: q)).toList(),

            const SizedBox(height: 10),

            // Add Button
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.add_circle,
                    color: Color(0xff014479), size: 30),
                onPressed: addQuestion,
              ),
            ),
            const SizedBox(height: 10),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff014479),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Submit',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
