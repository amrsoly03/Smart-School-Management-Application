import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/models/subject_model.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Core/widgets/custom_button.dart';
import 'package:nexura/Core/widgets/custom_form_field.dart';
import 'package:nexura/Core/widgets/custom_snackbar.dart';
import 'package:nexura/Features/Admin/presentation/manager/select_models_cubit/select_models_cubit.dart';
import 'package:nexura/Features/Admin/presentation/views/widgets/confirm_button.dart';
import 'package:nexura/Features/Admin/presentation/views/widgets/grades_sheet.dart';

import '../../../../../Core/widgets/custom_bottom_sheet.dart';
import '../../manager/admin_cubit/admin_cubit.dart';
import '../../manager/models_cubit/models_cubit.dart';

class AddDegreeViewBody extends StatelessWidget {
  AddDegreeViewBody({super.key});

  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController finalDegreeController = TextEditingController();
  final TextEditingController midtermController = TextEditingController();
  final TextEditingController practicalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ModelsCubit modelsCubit = BlocProvider.of<ModelsCubit>(context);
    AdminCubit adminCubit = BlocProvider.of<AdminCubit>(context);
    String selectedSubject = 'choose subject';
    SubjectModel subjectModel = const SubjectModel();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Set Degrees'),
      body: BlocConsumer<SelectModelsCubit, SelectModelsState>(
        listener: (context, state) {
          if (state is SubjectSelected) {
            selectedSubject = state.selectedSubject.name!;
            subjectModel = state.selectedSubject;
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Student Code
                CustomFormField(
                  labelText: 'student id',
                  controller: studentIdController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                // Dropdowns Row
                Row(
                  children: [
                    CustomButton(
                      title: selectedSubject,
                      function: () {
                        modelsCubit.viewGrades();
                        CustomBottomSheet(
                          context,
                          const GradesSheet(),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Final Degree
                CustomFormField(
                  labelText: 'final degree',
                  controller: finalDegreeController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                // Midterm Degree
                CustomFormField(
                  labelText: 'midterm degree',
                  controller: midtermController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                // Practical Degree
                CustomFormField(
                  labelText: 'practical degree',
                  controller: practicalController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 30),
                // Confirm Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConfirmButton(
                      title: 'confirm',
                      function: () {
                        if (subjectModel.subjectId == 0 ||
                            studentIdController.text.isEmpty) {
                          kShowSnackBar(
                              context, 'Please set the student id and subject');
                          return;
                        }
                        adminCubit.updateDegrees(
                          subject_degree: subjectModel.subjectId.toString(),
                          std_degree: studentIdController.text,
                          final_degree: finalDegreeController.text,
                          mid: midtermController.text,
                          practical: practicalController.text,
                        );
                        finalDegreeController.clear();
                        midtermController.clear();
                        practicalController.clear();
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
