import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/models/activity_model.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Core/widgets/custom_button.dart';
import 'package:nexura/Features/Admin/presentation/manager/models_cubit/models_cubit.dart';
import 'package:nexura/Features/Admin/presentation/manager/select_models_cubit/select_models_cubit.dart';
import 'package:nexura/Features/Admin/presentation/views/widgets/activities_sheet.dart';

import '../../../../../Core/widgets/custom_bottom_sheet.dart';
import 'custom_send_button.dart';

// ignore: must_be_immutable
class ActivitiesNotificationViewBody extends StatelessWidget {
  ActivitiesNotificationViewBody({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController notificationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ModelsCubit modelsCubit = BlocProvider.of<ModelsCubit>(context);

    String selectedActivity = 'select activity';
    ActivityModel activityModel = const ActivityModel();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Activities Notification'),
      body: BlocConsumer<SelectModelsCubit, SelectModelsState>(
        listener: (context, state) {
          if (state is ActivitySelected) {
            selectedActivity = state.selectedActivity.name!;
            activityModel = state.selectedActivity;
          }
        },
        builder: (context, state) {
          return Container(
            color: Colors.lightBlue[50],
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  child: CustomButton(
                    title: selectedActivity,
                    function: () {
                      modelsCubit.viewActivities();
                      CustomBottomSheet(
                        context,
                        const ActivitiesSheet(),
                      );
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
                            key: _formKey,
                            controller: notificationController,
                            style: Styles.textStyle16.copyWith(color: black),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'enter a valid value';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              //border: ,
                              hintText: 'enter the notification here',
                            ),
                            maxLines: 25,
                            minLines: 1,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CustomSendButton(
                            activity_an: activityModel.activityId.toString(),
                            contentController: notificationController,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
