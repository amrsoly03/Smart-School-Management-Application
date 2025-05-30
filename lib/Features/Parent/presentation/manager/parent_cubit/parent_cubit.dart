import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/models/parent_model.dart';
import 'package:nexura/Features/Parent/data/repo/parent_repo.dart';

part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {
  ParentCubit(this.parentRepo) : super(ParentInitial());

  final ParentRepo parentRepo;

  Future<void> parentLogin({
    required String student_id,
    required String parent_password,
  }) async {
    emit(ParentLoading());

    final loginResult = await parentRepo.parentLogin(
      student_id: student_id,
      parent_password: parent_password,
    );

    loginResult.fold(
      (failures) {
        emit(ParentFailure(failures.errMessage));
      },
      (parentModel) {
        emit(ParentLoginSuccess(parentModel));
      },
    );
  }
}
