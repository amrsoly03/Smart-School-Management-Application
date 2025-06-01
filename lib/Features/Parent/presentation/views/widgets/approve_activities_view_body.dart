import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Features/Parent/presentation/views/widgets/approve_activity_card.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/utils/theme.dart';
import '../../../../../Core/widgets/custom_appBar.dart';
import '../../../../../Core/widgets/custom_snackbar.dart';
import '../../manager/parent_cubit/parent_cubit.dart';

class ApproveActivitiesViewBody extends StatelessWidget {
  const ApproveActivitiesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Approve Activities'),
      body: BlocConsumer<ParentCubit, ParentState>(
        listener: (context, state) {
          if (state is ParentFailure) {
            kShowSnackBar(context, state.errMessage);
          } else if (state is ApproveActivitySuccess) {
            kShowSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is ParentFailure) {
            return Center(
                child: Text(
              state.errMessage,
              style: Styles.textStyle20.copyWith(color: darkBlue),
            ));
          } else if (state is ViewApproveActivitiesSuccess) {
            return ListView.separated(
              padding: const EdgeInsets.all(12.0),
              itemCount: state.activities.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return ApproveActivityCard(
                  activityModel: state.activities[index],
                );
              },
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
