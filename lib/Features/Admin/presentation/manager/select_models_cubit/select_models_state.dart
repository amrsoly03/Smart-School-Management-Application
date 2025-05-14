part of 'select_models_cubit.dart';

sealed class SelectModelsState extends Equatable {
  const SelectModelsState();

  @override
  List<Object> get props => [];
}

final class SelectModelsInitial extends SelectModelsState {}

final class SelectModelsLoading extends SelectModelsState {}

final class ActivitySelected extends SelectModelsState {
  final ActivityModel selectedActivity;

  const ActivitySelected(this.selectedActivity);
}
