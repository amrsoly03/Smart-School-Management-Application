import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import '../../../../../Core/widgets/custom_button.dart';

class QuizzesAndDegreesViewBody extends StatelessWidget {
  const QuizzesAndDegreesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'quizzes and degrees'),
      backgroundColor: const Color(0xffD6E8ED),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                title: 'Quizzes',
                function: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                title: 'Degrees',
                function: () {},
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
