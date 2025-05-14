import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Core/widgets/custom_form_field.dart';
import 'package:nexura/Features/Admin/presentation/manager/admin_cubit/admin_cubit.dart';

import '../../../../../Core/utils/theme.dart';
import '../../../../../Core/widgets/custom_snackbar.dart';

// ignore: must_be_immutable
class SendReportViewBody extends StatelessWidget {
  SendReportViewBody({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController studentIdController = TextEditingController();

  final TextEditingController reportController = TextEditingController();

  var _isUploading = false;

  @override
  Widget build(BuildContext context) {
    AdminCubit adminCubit = BlocProvider.of<AdminCubit>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'send report'),
      body: BlocConsumer<AdminCubit, AdminState>(
        listener: (context, state) {
          if (state is AdminLoading) {
            _isUploading = true;
          } else if (state is SendReportSuccess) {
            kShowSnackBar(context, state.message);
            _isUploading = false;
          } else if (state is AdminFailure) {
            kShowSnackBar(context, state.errMessage);
            log(state.errMessage);
            _isUploading = false;
          }
        },
        builder: (context, state) {
          return Container(
            color: Colors.lightBlue[50],
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: CustomFormField(
                      labelText: 'enter student ID',
                      controller: studentIdController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'enter a valid value';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: reportController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'enter a valid value';
                                }
                                return null;
                              },
                              style: Styles.textStyle16.copyWith(
                                color: black,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'write the report here',
                                
                              ),
                              maxLines: 25,
                              minLines: 1,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: _isUploading
                                ? const CircularProgressIndicator()
                                : ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        adminCubit.sendReport(
                                          std_report: studentIdController.text,
                                          content: reportController.text,
                                        );
                                        studentIdController.clear();
                                        reportController.clear();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        backgroundColor: darkBlue),
                                    child: const Text(
                                      'Send',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
