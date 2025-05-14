import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Features/Admin/presentation/manager/admin_cubit/admin_cubit.dart';

import '../../../../../Core/widgets/custom_elevated_buttom.dart';
import '../../../../../Core/widgets/custom_form_field.dart';
import '../../../../../Core/widgets/custom_snackbar.dart';

// ignore: must_be_immutable
class CreateAccountForm extends StatelessWidget {
  CreateAccountForm({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _enteredName = TextEditingController();
  final TextEditingController _enteredEmail = TextEditingController();
  final TextEditingController _enteredStdPass = TextEditingController();
  final TextEditingController _enteredParentPass = TextEditingController();
  final TextEditingController _enteredGrade = TextEditingController();

  var _isUploading = false;

  @override
  Widget build(BuildContext context) {
    AdminCubit adminCubit = BlocProvider.of<AdminCubit>(context);

    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is AdminLoading) {
          _isUploading = true;
        } else if (state is CreateUserSuccess) {
          kShowSnackBar(context, state.message);
          _enteredName.clear();
          _enteredEmail.clear();
          _enteredStdPass.clear();
          _enteredParentPass.clear();
          _enteredGrade.clear();
          _isUploading = false;
        } else if (state is AdminFailure) {
          kShowSnackBar(context, state.errMessage);
          log(state.errMessage);
          _isUploading = false;
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
                    controller: _enteredName,
                    labelText: 'full name',
                    keyboardType: TextInputType.name,
                    //onSaved: (value) => _enteredEmail = value!,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'enter valid name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomFormField(
                    controller: _enteredEmail,
                    labelText: 'email',
                    keyboardType: TextInputType.emailAddress,
                    //onSaved: (value) => _enteredEmail = value!,
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          !value.contains('@')) {
                        return 'enter valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomFormField(
                    controller: _enteredGrade,
                    labelText: 'grade',
                    keyboardType: TextInputType.number,
                    //onSaved: (value) => _enteredEmail = value!,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'enter a valid grade';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomFormField(
                    controller: _enteredStdPass,
                    labelText: 'student password',
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
                  CustomFormField(
                    controller: _enteredParentPass,
                    labelText: 'parent password',
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
                      label: 'Create Account',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          adminCubit.createUser(
                            s_name: _enteredName.text,
                            email: _enteredEmail.text,
                            student_password: _enteredStdPass.text,
                            parent_password: _enteredParentPass.text,
                            grade: _enteredGrade.text,
                          );
                        }
                      },
                    ),
                  if (_isUploading)
                    const Center(
                      child: CircularProgressIndicator(
                        color: darkBlue,
                      ),
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
