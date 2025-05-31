import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/models/activity_model.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Features/Parent/presentation/manager/parent_cubit/parent_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Core/utils/links.dart';
import '../../../../../Core/utils/size_config.dart';
import '../../../../../Core/utils/styles.dart';

class ApproveActivityCard extends StatelessWidget {
  const ApproveActivityCard({
    super.key,
    required this.activityModel,
  });

  final ActivityModel activityModel;

  @override
  Widget build(BuildContext context) {
    ParentCubit parentCubit = BlocProvider.of<ParentCubit>(context);

    return BlocConsumer<ParentCubit, ParentState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ParentLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: darkBlue,
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: SizeConfig.screenHeight * 0.2,
                    imageUrl:
                        '${Links.linkUploadActivities}/${activityModel.image}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: darkBlue.withOpacity(0.5),
                      highlightColor: darkBlue,
                      child: Container(
                        color: darkBlue,
                        width: double.infinity,
                        height: SizeConfig.screenHeight * 0.2,
                      ),
                    ),
                    errorWidget: (context, url, error) {
                      log('Error loading image: $error');
                      return const Icon(Icons.error);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Activity: ${activityModel.name}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    '${activityModel.price} EGP',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      parentCubit.approveActivity(
                        activity_as: activityModel.activityId.toString(),
                        total_price: activityModel.price.toString(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: background,
                    ),
                    child: Text(
                      'Approve',
                      style: Styles.textStyle16.copyWith(
                        color: darkBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
