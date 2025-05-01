import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Core/widgets/custom_button.dart';
import 'package:nexura/Core/widgets/custom_form_field.dart';

class AdminLoginViewBody extends StatelessWidget {
  AdminLoginViewBody({super.key});

  final TextEditingController emailContoller = TextEditingController();
  final TextEditingController passContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Login',
      ),
      backgroundColor: const Color(0xffD6E7EE),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Simulating curved text
                const Padding(
                  padding: EdgeInsets.only(right: 150),
                  child: Text(
                    'Login to your Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff014479),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Email TextField
                CustomFormField(
                  labelText: 'email',
                  controller: emailContoller,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                // Password TextField
                CustomFormField(
                  labelText: 'password',
                  controller: passContoller,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 30),
                // Log In Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    title: 'login',
                    function: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
