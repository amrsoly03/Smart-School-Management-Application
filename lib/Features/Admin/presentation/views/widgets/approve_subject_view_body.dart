import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Features/Admin/presentation/manager/models_cubit/models_cubit.dart';

import '../../../../../Core/functions/capitalize.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/utils/theme.dart';
import 'approve_subject_card.dart';

class ApproveSubjectViewBody extends StatelessWidget {
  const ApproveSubjectViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Approve Subject'),
      body: BlocBuilder<ModelsCubit, ModelsState>(
        builder: (context, state) {
          if (state is SubjectsSuccess) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: state.subjects.length,
                itemBuilder: (context, index) {
                  final subject = state.subjects[index];
                  return ApproveSubjectCard(subject: subject);
                },
              ),
            );
          } else if (state is ModelsFailure) {
            return Center(
              child: Text(
                capitalize(state.errMessage),
                style: Styles.textStyle20.copyWith(
                  color: darkBlue,
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: darkBlue,
              ),
            );
          }
        },
      ),
    );
  }
}
