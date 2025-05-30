import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../main.dart';
import '../../../data/repo/parent_repo.dart';

part 'fees_state.dart';

class FeesCubit extends Cubit<FeesState> {
  FeesCubit(this.parentRepo) : super(FeesInitial());

  final ParentRepo parentRepo;

  Future<void> viewFees() async {
    //emit(ParentLoading());

    final loginResult = await parentRepo.viewFees(
      student_id: sharedPref.getString('student_id')!,
    );

    loginResult.fold(
      (failures) {
        emit(FeesFailure(failures.errMessage));
        log(failures.errMessage);
      },
      (fees) {
        emit(ViewFeesSuccess(fees));
      },
    );
  }

  Future<void> feesDone({required String message}) async {
    emit(FeesDone(message));
    }
}
