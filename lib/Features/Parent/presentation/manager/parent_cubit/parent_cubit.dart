import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/models/parent_model.dart';
import 'package:nexura/Features/Parent/data/repo/parent_repo.dart';
import 'package:nexura/main.dart';

import '../../../../../Core/models/order_model.dart';
import '../../../../../Core/models/report_model.dart';

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

  Future<void> parentSendReport({
    required String std_report,
    required String content,
  }) async {
    emit(ParentLoading());

    final loginResult = await parentRepo.parentSendReport(
      std_report: std_report,
      content: content,
    );

    loginResult.fold(
      (failures) {
        emit(ParentFailure(failures.errMessage));
      },
      (message) {
        emit(SendReportSuccess(message));
      },
    );
  }

  Future<void> viewParentSentReports({required String std_report}) async {
    emit(ParentLoading());

    final loginResult =
        await parentRepo.viewParentSentReports(std_report: std_report);

    loginResult.fold(
      (failures) {
        emit(ParentFailure(failures.errMessage));
      },
      (reports) {
        emit(ViewSentReportsSuccess(reports));
      },
    );
  }

  Future<void> viewCoins() async {
    emit(ParentLoading());

    final loginResult = await parentRepo.viewCoins(
      parent_id: sharedPref.getString('user_id')!,
    );

    loginResult.fold(
      (failures) {
        emit(ParentFailure(failures.errMessage));
      },
      (coins) {
        emit(ViewCoinsSuccess(coins));
      },
    );
  }

  Future<void> viewPreviousTransactions({
    required String order_student,
    required String order_approved,
  }) async {
    emit(ParentLoading());

    final loginResult = await parentRepo.viewPreviousTransactions(
      order_student: order_student,
      order_approved: order_approved,
    );

    loginResult.fold(
      (failures) {
        emit(ParentFailure(failures.errMessage));
      },
      (orders) {
        emit(ViewPreviousTransactionsSuccess(orders));
      },
    );
  }
}
