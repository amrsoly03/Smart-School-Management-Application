import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Features/Admin/data/models/admin_model.dart';

import '../../../../../Core/errors/failures.dart';
import '../../../data/repo/admin_repo.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit(this.adminRepo) : super(AdminInitial());

  final AdminRepo adminRepo;

  late Either<Failures, AdminModel> loginResult;
  late Either<Failures, String> createUserResult;
  late Either<Failures, String> editUserResult;
  late Either<Failures, String> sendReportResult;

  Future<void> adminLogin({
    required String email,
    required String admin_password,
  }) async {
    emit(AdminLoading());

    loginResult = await adminRepo.adminLogin(
        email: email, admin_password: admin_password);

    loginResult.fold(
      (failures) {
        emit(AdminFailure(failures.errMessage));
      },
      (adminModel) {
        emit(
          AdminLoginSuccess(adminModel),
        );
      },
    );
  }

  Future<void> createUser({
    required String s_name,
    required String email,
    required String student_password,
    required String parent_password,
    required String grade,
  }) async {
    emit(AdminLoading());

    createUserResult = await adminRepo.createUser(
      s_name: s_name,
      email: email,
      student_password: student_password,
      parent_password: parent_password,
      grade: grade,
    );

    createUserResult.fold(
      (failures) {
        emit(AdminFailure(failures.errMessage));
      },
      (message) {
        emit(
          CreateUserSuccess(message),
        );
      },
    );
  }

  Future<void> editUser({
    required String student_id,
    required String s_name,
    required String email,
    required String student_password,
    required String parent_password,
  }) async {
    emit(AdminLoading());

    createUserResult = await adminRepo.editUser(
      student_id: student_id,
      s_name: s_name,
      email: email,
      student_password: student_password,
      parent_password: parent_password,
    );

    createUserResult.fold(
      (failures) {
        emit(AdminFailure(failures.errMessage));
      },
      (message) {
        emit(
          EditUserSuccess(message),
        );
      },
    );
  }

  Future<void> sendReport({
    required String std_report,
    required String content,
  }) async {
    emit(AdminLoading());

    sendReportResult = await adminRepo.sendReport(
      std_report: std_report,
      content: content,
    );

    sendReportResult.fold(
      (failures) {
        emit(AdminFailure(failures.errMessage));
      },
      (message) {
        emit(
          SendReportSuccess(message),
        );
      },
    );
  }
}
