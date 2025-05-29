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

final class StudentDegreesSuccess extends StudentState {
  final List<DegreeModel> degrees;

  const StudentDegreesSuccess(this.degrees);
}

final class StudentQuizzesSuccess extends StudentState {
  final List<QuizModel> quizzes;

  const StudentQuizzesSuccess(this.quizzes);
}

final class StudentScheduleSuccess extends StudentState {
  final String scheduleImage;

  const StudentScheduleSuccess(this.scheduleImage);
}

final class SubscribeActivitySuccess extends StudentState {
  final String message;

  const SubscribeActivitySuccess(this.message);
}


final class AddOrderSuccess extends StudentState {
  final OrderModel order;

  const AddOrderSuccess(this.order);
}

final class AddOrderProductsSuccess extends StudentState {
  final String message;

  const AddOrderProductsSuccess(this.message);
}