import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Features/Admin/presentation/manager/models_cubit/models_cubit.dart';
import 'package:nexura/Features/Admin/presentation/manager/select_models_cubit/select_models_cubit.dart';
import 'package:nexura/Features/Admin/presentation/views/widgets/subjects_sheet.dart';

import '../../../../../Core/functions/capitalize.dart';
import '../../../../../Core/utils/theme.dart';
import '../../../../../Core/widgets/custom_bottom_sheet.dart';

class GradesSheet extends StatelessWidget {
  const GradesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    ModelsCubit modelsCubit = BlocProvider.of<ModelsCubit>(context);

    SelectModelsCubit selectModelsCubit =
        BlocProvider.of<SelectModelsCubit>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          capitalize('select grade'),
          style: Styles.textStyle16,
        ),
        BlocBuilder<ModelsCubit, ModelsState>(
          builder: (context, state) {
            if (state is GradesSuccess) {
              return ListView.separated(
                itemCount: state.grades.length,
                shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => TextButton(
                  onPressed: () {
                    selectModelsCubit.setSelectedGrade(
                      state.grades[index],
                    );
                    GoRouter.of(context).pop();
                    modelsCubit.viewSubjects(
                        sub_grade: state.grades[index].gradeId.toString());
                    CustomBottomSheet(
                      context,
                      const SubjectsSheet(),
                    );
                  },
                  child: Text(
                    capitalize(state.grades[index].grade.toString()),
                    style: Styles.textStyle20,
                  ),
                ),
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 2,
                    width: double.infinity,
                    color: white,
                  ),
                ),
              );
            } else if (state is ModelsFailure) {
              return Center(
                child: Text(
                  capitalize(state.errMessage),
                  style: Styles.textStyle16,
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        Row(
          children: [
            const Spacer(),
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Text(capitalize('cancel'), style: Styles.textStyle16),
            ),
          ],
        )
      ],
    );
  }
}
