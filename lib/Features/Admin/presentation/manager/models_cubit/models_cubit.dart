import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/models/activity_model.dart';

import '../../../../../Core/errors/failures.dart';
import '../../../data/repo/admin_repo.dart';

part 'models_state.dart';

class ModelsCubit extends Cubit<ModelsState> {
  ModelsCubit(this.adminRepo) : super(ModelsInitial());

  final AdminRepo adminRepo;

  late Either<Failures, List<ActivityModel>> activitiesResult;

    Future<void> viewActivities() async {
    emit(ModelsLoading());

    activitiesResult = await adminRepo.viewActivities();

    activitiesResult.fold(
      (failure) {
        emit(ModelsFailure(failure.errMessage));
      },
      (activities) {
        emit(ActivitiesSuccess(activities));
      },
    );
  }
}
