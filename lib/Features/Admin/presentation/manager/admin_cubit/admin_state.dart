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

final class SendReportSuccess extends AdminState {
  final String message;

  const SendReportSuccess(this.message);
}
