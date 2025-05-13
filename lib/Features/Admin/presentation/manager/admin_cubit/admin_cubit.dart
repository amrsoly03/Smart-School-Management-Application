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

  late Either<Failures, AdminModel> result;

  Future<void> adminLogin({
    required String email,
    required String admin_password,
  }) async {
    emit(AdminLoading());

    result = await adminRepo.adminLogin(
        email: email, admin_password: admin_password);

    result.fold(
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
}
