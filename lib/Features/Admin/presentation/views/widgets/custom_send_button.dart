import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Features/Admin/presentation/manager/admin_cubit/admin_cubit.dart';

import '../../../../../Core/utils/theme.dart';
import '../../../../../Core/widgets/custom_snackbar.dart';

// ignore: must_be_immutable
class CustomSendButton extends StatelessWidget {
  CustomSendButton({
    super.key,
    required this.activity_an,
    required this.contentController,
  });

  final String activity_an;
  final TextEditingController contentController;

  var _isUploading = false;

  @override
  Widget build(BuildContext context) {
    AdminCubit adminCubit = BlocProvider.of<AdminCubit>(context);

    return BlocConsumer<AdminCubit, AdminState>(
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
        return _isUploading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  log('an: $activity_an, content: ${contentController.text}');
                  if (activity_an == 'null' || contentController.text.isEmpty) {
                    kShowSnackBar(context, 'Please enter all fields');
                    return;
                  }
                  adminCubit.sendActivityNotification(
                    activity_an: activity_an,
                    content: contentController.text,
                  );
                  contentController.clear();
                },
                style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: darkBlue),
                child: const Text(
                  'Send',
                  style: TextStyle(color: Colors.white),
                ),
              );
      },
    );
  }
}
