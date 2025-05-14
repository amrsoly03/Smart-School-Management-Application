import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Features/Admin/presentation/manager/admin_cubit/admin_cubit.dart';
import 'package:nexura/Features/Admin/presentation/manager/models_cubit/models_cubit.dart';

import '../../../../../Core/utils/theme.dart';
import '../../../../../Core/widgets/custom_snackbar.dart';

// ignore: must_be_immutable
class CustomApproveButton extends StatelessWidget {
  CustomApproveButton({
    super.key,
    required this.as_id,
  });

  final String as_id;

  var _isUploading = false;

  @override
  Widget build(BuildContext context) {
    AdminCubit adminCubit = BlocProvider.of<AdminCubit>(context);
    ModelsCubit modelsCubit = BlocProvider.of<ModelsCubit>(context);

    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is AdminLoading) {
          _isUploading = true;
        } else if (state is ApproveSubjectSuccess) {
          kShowSnackBar(context, state.message);
          _isUploading = false;
          modelsCubit.viewSubjects();
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
                  adminCubit.approveSubject(
                    as_id: as_id,
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: background,
                ),
                child:  Text(
                  'Approve',
                  style: Styles.textStyle16.copyWith(
                    color: darkBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
      },
    );
  }
}
