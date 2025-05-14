import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nexura/Core/models/activity_model.dart';

part 'select_models_state.dart';

class SelectModelsCubit extends Cubit<SelectModelsState> {
  SelectModelsCubit() : super(SelectModelsInitial());

  late ActivityModel selectedActivity;

  void setSelectedActivity(ActivityModel value) {
    emit(SelectModelsInitial());
    selectedActivity = value;
    emit(ActivitySelected(selectedActivity));
  }
}
