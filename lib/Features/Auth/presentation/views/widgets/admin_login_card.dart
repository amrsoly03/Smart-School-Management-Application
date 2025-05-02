import 'package:flutter/material.dart';

import '../../../../../Core/widgets/custom_elevated_buttom.dart';
import '../../../../../Core/widgets/custom_form_field.dart';

// ignore: must_be_immutable
class AdminLoginCard extends StatelessWidget {
  AdminLoginCard({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _enteredEmail = TextEditingController();

  TextEditingController _enteredPassword = TextEditingController();

  var _isUploading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 15),
              CustomFormField(
                controller: _enteredEmail,
                labelText: 'Email',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                //onSaved: (value) => _enteredEmail = value!,
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      !value.contains('@')) {
                    return 'enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              CustomFormField(
                controller: _enteredPassword,
                labelText: 'Password',
                icon: Icons.remove_red_eye_outlined,
                keyboardType: TextInputType.name,
                //onSaved: (value) => _enteredPassword = value!,
                validator: (value) {
                  if (value == null || value.trim().length < 6) {
                    return 'password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              if (!_isUploading)
                CustomElevatedButton(
                  label: 'Login',
                  onPressed: () {},
                ),
              if (!_isUploading)
                if (_isUploading) const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
