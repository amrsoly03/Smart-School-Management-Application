import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Features/Admin/presentation/views/widgets/custom_image_picker.dart';

import '../../../../../Core/utils/theme.dart';
import '../../../../../Core/widgets/custom_elevated_buttom.dart';
import '../../../../../Core/widgets/custom_form_field.dart';
import '../../../../../Core/widgets/custom_snackbar.dart';
import '../../manager/admin_cubit/admin_cubit.dart';

// ignore: must_be_immutable
class AddActivityForm extends StatelessWidget {
  AddActivityForm({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _enteredName = TextEditingController();
  final TextEditingController _enteredDescription = TextEditingController();
  final TextEditingController _enteredPrice = TextEditingController();

  var _isUploading = false;

  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    AdminCubit adminCubit = BlocProvider.of<AdminCubit>(context);

    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is AdminLoading) {
          _isUploading = true;
        } else if (state is AddActivitySuccess) {
          kShowSnackBar(context, state.message);
          _enteredName.clear();
          _enteredDescription.clear();
          _enteredPrice.clear();
          _selectedImage = null;
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
                  CustomImagePicker(
                    key: state is AddActivitySuccess ? UniqueKey() : null,
                    onPickedImage: (File pickedImage) {
                      _selectedImage = pickedImage;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomFormField(
                    controller: _enteredName,
                    labelText: 'activity name',
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
                    controller: _enteredDescription,
                    labelText: 'activity description',
                    keyboardType: TextInputType.name,
                    //onSaved: (value) => _enteredEmail = value!,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'enter valid description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomFormField(
                    controller: _enteredPrice,
                    labelText: 'activity price',
                    keyboardType: TextInputType.number,
                    //onSaved: (value) => _enteredEmail = value!,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'enter a valid price';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  if (!_isUploading)
                    CustomElevatedButton(
                      label: 'Add Activity',
                      onPressed: () {
                        if (_selectedImage == null) {
                          return kShowSnackBar(
                            context,
                            'Please select an image for the activity',
                          );
                        }
                        if (_formKey.currentState!.validate() &&
                            _selectedImage != null) {
                          adminCubit.addActivity(
                            name: _enteredName.text,
                            description: _enteredDescription.text,
                            price: _enteredPrice.text,
                            image: _selectedImage!,
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
