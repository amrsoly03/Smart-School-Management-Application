import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/theme.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/widgets/custom_elevated_buttom.dart';
import '../../../../../Core/widgets/custom_form_field.dart';

// ignore: must_be_immutable
class ParentLoginCard extends StatelessWidget {
  ParentLoginCard({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _enteredId = TextEditingController();

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
                controller: _enteredId,
                labelText: 'ID',
                icon: Icons.perm_identity_outlined,
                keyboardType: TextInputType.number,
                //onSaved: (value) => _enteredEmail = value!,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'enter valid ID';
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
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kParentHomeView);
                  },
                ),
              if (!_isUploading)
                if (_isUploading)
                  const CircularProgressIndicator(
                    color: darkBlue,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
