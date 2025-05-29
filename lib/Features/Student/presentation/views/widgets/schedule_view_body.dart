import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/utils/size_config.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Features/Student/presentation/manager/student_cubit/student_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Core/utils/links.dart';

class ScheduleViewBody extends StatelessWidget {
  const ScheduleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Schedule'),
      body: BlocBuilder<StudentCubit, StudentState>(
        builder: (context, state) {
          if (state is StudentFailure) {
            return Center(
              child: Text(
                state.errMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state is StudentScheduleSuccess) {
            log('schedule image: ${Links.linkUploadSchedule}/${state.scheduleImage}');
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                        '${Links.linkUploadSchedule}/${state.scheduleImage}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: darkBlue.withOpacity(0.5),
                      highlightColor: darkBlue,
                      child: Container(
                        color: darkBlue,
                        width: double.infinity,
                        height: SizeConfig.screenHeight * 0.6,
                      ),
                    ),
                    errorWidget: (context, url, error) {
                      log('Error loading image: $error');
                      return const Icon(Icons.error);
                    },
                  ),
                ),
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
