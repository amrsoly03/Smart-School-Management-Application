import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Features/Student/presentation/manager/student_cubit/student_cubit.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/widgets/custom_elevated_buttom.dart';
import '../../../../../Core/widgets/custom_form_field.dart';
import '../../../../../Core/widgets/custom_snackbar.dart';
import '../../../../../main.dart';

// ignore: must_be_immutable
class StudentLoginCard extends StatelessWidget {
  StudentLoginCard({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _enteredId = TextEditingController();

  final TextEditingController _enteredPassword = TextEditingController();

  var _isUploading = false;

  @override
  Widget build(BuildContext context) {
    StudentCubit studentCubit = BlocProvider.of<StudentCubit>(context);

    return BlocConsumer<StudentCubit, StudentState>(
      listener: (context, state) {
        if (state is StudentLoading) {
          _isUploading = true;
        } else if (state is StudentLoginSuccess) {
          sharedPref.setString(
            'user_id',
            state.studentModel.studentId.toString(),
          );
          sharedPref.setString('user_type', 'student');
          GoRouter.of(context).push(AppRouter.kStudentHomeView).then(
            (value) {
              _isUploading = false;
            },
          );
        } else if (state is StudentFailure) {
          _isUploading = false;
          kShowSnackBar(context, state.errMessage);
          log(state.errMessage);
        }
      },
      builder: (context, state) {
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
                        if (_formKey.currentState!.validate()) {
                          studentCubit.studentLogin(
                            student_Id: _enteredId.text,
                            student_password: _enteredPassword.text,
                          );
                        }
                      },
                    ),
                  if (_isUploading)
                    const CircularProgressIndicator(
                      color: darkBlue,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
