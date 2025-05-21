import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Features/Admin/presentation/manager/models_cubit/models_cubit.dart';
import 'package:nexura/Features/Admin/presentation/manager/select_models_cubit/select_models_cubit.dart';

import '../../../../../Core/functions/capitalize.dart';
import '../../../../../Core/utils/theme.dart';

class SubjectsSheet extends StatelessWidget {
  const SubjectsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    SelectModelsCubit selectModelsCubit = BlocProvider.of<SelectModelsCubit>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          capitalize('select subject'),
          style: Styles.textStyle16,
        ),
        BlocBuilder<ModelsCubit, ModelsState>(
          builder: (context, state) {
            if (state is SubjectsSuccess) {
              return ListView.separated(
                itemCount: state.subjects.length,
                shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => TextButton(
                  onPressed: () {
                    selectModelsCubit.setSelectedSubject(
                      state.subjects[index],
                    );
                    GoRouter.of(context).pop();
                  },
                  child: Text(
                    capitalize(state.subjects[index].name!),
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
