import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/app_router.dart';
import 'package:nexura/Core/utils/links.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Features/Admin/presentation/manager/models_cubit/models_cubit.dart';

import '../../../../../Core/widgets/custom_appBar.dart';
import 'custom_container.dart';

class ActivitiesViewBody extends StatelessWidget {
  const ActivitiesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'activities'),
      body: BlocBuilder<ModelsCubit, ModelsState>(
        builder: (context, state) {
          if (state is ModelsFailure) {
            return Center(
              child: Text(
                state.errMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state is ActivitiesSuccess) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              itemCount: state.activities.length,
              separatorBuilder: (context, index) => const SizedBox(height: 30),
              itemBuilder: (context, index) {
                return CustomContainer(
                  title: state.activities[index].name!,
                  isNetworkImage: true,
                  image:
                      '${Links.linkUploadActivities}/${state.activities[index].image}',
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kActivityDetailsView,
                      extra: state.activities[index],
                    );
                  },
                );
              },
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: darkBlue,
            ));
          }
        },
      ),
    );
  }
}
