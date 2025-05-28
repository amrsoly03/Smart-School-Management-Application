import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Features/Student/presentation/manager/student_cubit/student_cubit.dart';

import 'degree_card.dart';

class DegreesViewBody extends StatelessWidget {
  const DegreesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Degrees'),
      body: BlocBuilder<StudentCubit, StudentState>(
        builder: (context, state) {
          if (state is StudentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StudentDegreesSuccess) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                itemCount: state.degrees.length,
                itemBuilder: (context, index) {
                  return DegreeCard(degreeModel: state.degrees[index]);
                },
              ),
            );
          } else if (state is StudentFailure) {
            return Center(child: Text(state.errMessage));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
