part of 'admin_cubit.dart';

sealed class AdminState extends Equatable {
  const AdminState();

  @override
  List<Object> get props => [];
}

final class AdminInitial extends AdminState {}

final class AdminLoading extends AdminState {}

final class AdminFailure extends AdminState {
  final String errMessage;

  const AdminFailure(this.errMessage);
}

final class AdminLoginSuccess extends AdminState {
  final AdminModel adminModel;

  const AdminLoginSuccess(this.adminModel);
}

final class CreateUserSuccess extends AdminState {
  final String message;

  const CreateUserSuccess(this.message);
}

final class EditUserSuccess extends AdminState {
  final String message;

  const EditUserSuccess(this.message);
}

final class SendReportSuccess extends AdminState {
  final String message;

  const SendReportSuccess(this.message);
}

final class ViewSentReportsSuccess extends AdminState {
  final List<ReportModel> reports;

  const ViewSentReportsSuccess(this.reports);
}

final class ApproveSubjectSuccess extends AdminState {
  final String message;

  const ApproveSubjectSuccess(this.message);
}

final class UpdateDegreesSuccess extends AdminState {
  final String message;

  const UpdateDegreesSuccess(this.message);
}

final class AddQuizSuccess extends AdminState {
  final QuizModel quizModel;

  const AddQuizSuccess(this.quizModel);
}

final class AddAllQuestionsSuccess extends AdminState {
  final String message;

  const AddAllQuestionsSuccess(this.message);
}

final class AddProductSuccess extends AdminState {
  final String message;

  const AddProductSuccess(this.message);
}

final class AddActivitySuccess extends AdminState {
  final String message;

  const AddActivitySuccess(this.message);
}
