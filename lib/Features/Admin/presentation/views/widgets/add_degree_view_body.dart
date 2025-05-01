import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Core/widgets/custom_button.dart';
import 'package:nexura/Core/widgets/custom_form_field.dart';

// ignore: must_be_immutable
class AddDegreeViewBody extends StatelessWidget {
  AddDegreeViewBody({super.key});

  String? selectedTest;

  String? selectedSubject;

  final List<String> testOptions = ['Midterm', 'Final', 'Practical'];
  final List<String> subjectOptions = ['Math', 'Science', 'English'];

  final TextEditingController studentCodeController = TextEditingController();
  final TextEditingController finalDegreeController = TextEditingController();
  final TextEditingController midtermController = TextEditingController();
  final TextEditingController practicalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD6E7EE),
      appBar: const CustomAppBar(title: 'Add Degree'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Student Code
              CustomFormField(
                labelText: 'student id',
                controller: finalDegreeController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              // Dropdowns Row
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff014479),
                        hintStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      dropdownColor: const Color(0xff014479),
                      hint: const Text('Choose test',
                          style: TextStyle(color: Colors.white)),
                      value: selectedTest,
                      onChanged: (value) {
                        // setState(() => selectedTest = value);
                      },
                      items: testOptions
                          .map((test) => DropdownMenuItem(
                                value: test,
                                child: Text(test,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff014479),
                        hintStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      dropdownColor: const Color(0xff014479),
                      hint: const Text('Choose subject',
                          style: TextStyle(color: Colors.white)),
                      value: selectedSubject,
                      onChanged: (value) {
                        //setState(() => selectedSubject = value);
                      },
                      items: subjectOptions
                          .map((subject) => DropdownMenuItem(
                                value: subject,
                                child: Text(subject,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Final Degree
              CustomFormField(
                labelText: 'final degree',
                controller: finalDegreeController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              // Midterm Degree
              CustomFormField(
                labelText: 'midterm degree',
                controller: midtermController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              // Practical Degree
              CustomFormField(
                labelText: 'practical degree',
                controller: practicalController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              // Confirm Button
              Row(
                children: [
                  CustomButton(
                    title: 'confirm',
                    function: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
