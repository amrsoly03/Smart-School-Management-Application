import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nexura/Core/models/activity_model.dart';
import 'package:nexura/Core/models/grade_model.dart';

import '../../../../../Core/models/subject_model.dart';

part 'select_models_state.dart';

class SelectModelsCubit extends Cubit<SelectModelsState> {
  SelectModelsCubit() : super(SelectModelsInitial());

  late ActivityModel selectedActivity;
  late GradeModel selectedGrade;
  late SubjectModel selectedSubject;

  void setSelectedActivity(ActivityModel value) {
    emit(SelectModelsInitial());
    selectedActivity = value;
    emit(ActivitySelected(selectedActivity));
  }

  void setSelectedGrade(GradeModel value) {
    emit(SelectModelsInitial());
    selectedGrade = value;
    emit(GradeSelected(selectedGrade));
  }

  void setSelectedSubject(SubjectModel value) {
    emit(SelectModelsInitial());
    selectedSubject = value;
    emit(SubjectSelected(selectedSubject));
  }
}
