part of 'models_cubit.dart';

sealed class ModelsState extends Equatable {
  const ModelsState();

  @override
  List<Object> get props => [];
}

final class ModelsInitial extends ModelsState {}

final class ModelsLoading extends ModelsState {}

final class ModelsFailure extends ModelsState {
  final String errMessage;

  const ModelsFailure(this.errMessage);
}

final class ActivitiesSuccess extends ModelsState {
  final List<ActivityModel> activities;

  const ActivitiesSuccess(this.activities);
}
