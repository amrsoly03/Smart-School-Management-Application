import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/functions/capitalize.dart';
import 'package:nexura/Core/models/activity_model.dart';
import 'package:nexura/Core/utils/size_config.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Core/widgets/custom_snackbar.dart';
import 'package:nexura/Features/Student/presentation/manager/student_cubit/student_cubit.dart';
import 'package:nexura/main.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Core/utils/links.dart';

class ActivityDetailsViewBody extends StatelessWidget {
  const ActivityDetailsViewBody({super.key, required this.activityModel});

  final ActivityModel activityModel;

  @override
  Widget build(BuildContext context) {
    StudentCubit studentCubit = BlocProvider.of<StudentCubit>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      '${Links.linkUploadActivities}/${activityModel.image}',
                  height: SizeConfig.screenHeight * 0.4,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: darkBlue.withOpacity(0.5),
                    highlightColor: darkBlue,
                    child: Container(
                      color: darkBlue,
                      width: double.infinity,
                      height: SizeConfig.screenHeight * 0.4,
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    log('Error loading image: $error');
                    return const Icon(Icons.error);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      capitalize('informations:'),
                      style: Styles.textStyle25.copyWith(
                        color: darkBlue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      capitalize(activityModel.description!),
                      style: Styles.textStyle14.copyWith(
                        color: darkBlue,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        capitalize('Price: ${activityModel.price}'),
                        textAlign: TextAlign.center,
                        style: Styles.textStyle20.copyWith(
                          color: darkBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: BlocListener<StudentCubit, StudentState>(
          listener: (context, state) {
            if (state is SubscribeActivitySuccess) {
              kShowSnackBar(context, state.message);
            } else if (state is StudentFailure) {
              kShowSnackBar(context, state.errMessage);
            }
          },
          child: Container(
            padding: const EdgeInsets.only(bottom: 10),
            width: SizeConfig.screenWidth / 1.25,
            child: FloatingActionButton(
              onPressed: () {
                studentCubit.subscribeActivity(
                  student_as: sharedPref.getString('user_id')!,
                  activity_as: activityModel.activityId.toString(),
                );
              },
              backgroundColor: darkBlue,
              child: Text(
                capitalize('subscribe'),
                style: Styles.textStyle18,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
