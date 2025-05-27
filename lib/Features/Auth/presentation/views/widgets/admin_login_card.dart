import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Features/Admin/presentation/manager/admin_cubit/admin_cubit.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/widgets/custom_elevated_buttom.dart';
import '../../../../../Core/widgets/custom_form_field.dart';
import '../../../../../Core/widgets/custom_snackbar.dart';
import '../../../../../first_screen.dart';

// ignore: must_be_immutable
class AdminLoginCard extends StatelessWidget {
  AdminLoginCard({super.key, required this.type});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _enteredEmail = TextEditingController();

  final TextEditingController _enteredPassword = TextEditingController();

  var _isUploading = false;

  final String type;

  @override
  Widget build(BuildContext context) {
    AdminCubit adminCubit = BlocProvider.of<AdminCubit>(context);

    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is AdminLoading) {
          _isUploading = true;
        } else if (state is AdminLoginSuccess) {
          if (type == Users.schoolAdmin.name) {
            GoRouter.of(context)
                .pushReplacement(AppRouter.kSchoolAdminHomeView)
                .then(
              (value) {
                _isUploading = false;
              },
            );
          } else if (type == Users.cafeteriaAdmin.name) {
          } else if (type == Users.activitiesAdmin.name) {
          } else if (type == Users.teacher.name) {}
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          adminCubit.adminLogin(
                            email: _enteredEmail.text,
                            admin_password: _enteredPassword.text,
                            type: type,
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
