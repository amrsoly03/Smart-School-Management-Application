part of 'student_cubit.dart';

sealed class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object> get props => [];
}

final class StudentInitial extends StudentState {}

final class StudentLoading extends StudentState {}

final class StudentFailure extends StudentState {
  final String errMessage;

  const StudentFailure(this.errMessage);
}

final class StudentLoginSuccess extends StudentState {
  final StudentModel studentModel;

  const StudentLoginSuccess(this.studentModel);
}
