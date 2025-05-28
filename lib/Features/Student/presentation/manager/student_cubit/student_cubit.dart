import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Features/Student/data/repo/student_repo.dart';

import '../../../data/models/student_model.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit(this.studentRepo) : super(StudentInitial());

  final StudentRepo studentRepo;

  Future<void> studentLogin({
    required String student_Id,
    required String student_password,
  }) async {
    emit(StudentLoading());

    final loginResult = await studentRepo.studentLogin(
      student_Id: student_Id,
      student_password: student_password,
    );

    loginResult.fold(
      (failures) {
        emit(StudentFailure(failures.errMessage));
      },
      (studentModel) {
        emit(StudentLoginSuccess(studentModel));
      },
    );
  }
}
