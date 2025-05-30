import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Core/widgets/custom_snackbar.dart';
import 'package:nexura/Features/Parent/presentation/manager/parent_cubit/parent_cubit.dart';
import 'package:nexura/main.dart';

import '../../../../../Core/utils/theme.dart';

// ignore: must_be_immutable
class ParentSendReportViewBody extends StatelessWidget {
  ParentSendReportViewBody({super.key});

  final TextEditingController reportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ParentCubit parentCubit = BlocProvider.of<ParentCubit>(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'send report'),
      body: Container(
        color: Colors.lightBlue[50],
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
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
                      child: TextField(
                        controller: reportController,
                        style: Styles.textStyle16.copyWith(
                          color: darkBlue,
                        ),
                        decoration: const InputDecoration(
                          //border: ,
                          hintText: 'write the report here',
                        ),
                        maxLines: 25,
                        minLines: 1,
                      ),
                    ),
                    BlocConsumer<ParentCubit, ParentState>(
                      listener: (context, state) {
                        if (state is SendReportSuccess) {
                          kShowSnackBar(context, state.message);
                          GoRouter.of(context).pop();
                        } else if (state is ParentFailure) {
                          kShowSnackBar(context, state.errMessage);
                          log(state.errMessage);
                        }
                      },
                      builder: (context, state) {
                        return Align(
                          alignment: Alignment.bottomRight,
                          child: state is ParentLoading
                              ? const CircularProgressIndicator(
                                color: darkBlue,
                              )
                              : ElevatedButton(
                                  onPressed: () {
                                    if (reportController.text.isEmpty) {
                                      kShowSnackBar(
                                          context, 'Please enter report first');
                                      return;
                                    }
                                    parentCubit.parentSendReport(
                                      std_report:
                                          sharedPref.getString('student_id')!,
                                      content: reportController.text,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      backgroundColor: darkBlue),
                                  child: const Text(
                                    'Send',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
