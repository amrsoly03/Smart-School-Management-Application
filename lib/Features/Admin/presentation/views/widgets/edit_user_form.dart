import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Features/Admin/presentation/manager/admin_cubit/admin_cubit.dart';

import '../../../../../Core/widgets/custom_elevated_buttom.dart';
import '../../../../../Core/widgets/custom_form_field.dart';
import '../../../../../Core/widgets/custom_snackbar.dart';

// ignore: must_be_immutable
class EditUserForm extends StatelessWidget {
  EditUserForm({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _enteredId = TextEditingController();
  final TextEditingController _enteredName = TextEditingController();
  final TextEditingController _enteredEmail = TextEditingController();
  final TextEditingController _enteredStdPass = TextEditingController();
  final TextEditingController _enteredParentPass = TextEditingController();

  var _isUploading = false;

  @override
  Widget build(BuildContext context) {
    AdminCubit adminCubit = BlocProvider.of<AdminCubit>(context);

    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is AdminLoading) {
          _isUploading = true;
        } else if (state is EditUserSuccess) {
          kShowSnackBar(context, state.message);
          _enteredId.clear();
          _enteredName.clear();
          _enteredEmail.clear();
          _enteredStdPass.clear();
          _enteredParentPass.clear();
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
                    controller: _enteredId,
                    labelText: 'student ID',
                    keyboardType: TextInputType.number,
                    //onSaved: (value) => _enteredEmail = value!,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'enter valid ID';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  CustomFormField(
                    controller: _enteredName,
                    labelText: 'change name',
                    keyboardType: TextInputType.name,
                    //onSaved: (value) => _enteredEmail = value!,
                  ),
                  const SizedBox(height: 15),
                  CustomFormField(
                    controller: _enteredEmail,
                    labelText: 'change email',
                    keyboardType: TextInputType.emailAddress,
                    //onSaved: (value) => _enteredEmail = value!,
                  ),
                  const SizedBox(height: 15),
                  CustomFormField(
                    controller: _enteredStdPass,
                    labelText: 'change student password',
                    keyboardType: TextInputType.name,
                    //onSaved: (value) => _enteredPassword = value!,
                  ),
                  const SizedBox(height: 15),
                  CustomFormField(
                    controller: _enteredParentPass,
                    labelText: 'change parent password',
                    keyboardType: TextInputType.name,
                    //onSaved: (value) => _enteredPassword = value!,
                  ),
                  const SizedBox(height: 15),
                  if (!_isUploading)
                    CustomElevatedButton(
                      label: 'Submit',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          adminCubit.editUser(
                            student_id: _enteredId.text,
                            s_name: _enteredName.text,
                            email: _enteredEmail.text,
                            student_password: _enteredStdPass.text,
                            parent_password: _enteredParentPass.text,
                          );
                        }
                      },
                    ),
                  if (_isUploading) const CircularProgressIndicator(
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
