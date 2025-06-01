import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/models/question_model.dart';
import 'package:nexura/Core/models/quiz_model.dart';
import 'package:nexura/Features/Admin/data/models/admin_model.dart';

import '../../../../../Core/errors/failures.dart';
import '../../../../../Core/models/order_model.dart';
import '../../../../../Core/models/report_model.dart';
import '../../../data/repo/admin_repo.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit(this.adminRepo) : super(AdminInitial());

  final AdminRepo adminRepo;

  late Either<Failures, AdminModel> loginResult;
  late Either<Failures, String> createUserResult;
  late Either<Failures, String> editUserResult;
  late Either<Failures, String> sendReportResult;
  late Either<Failures, List<ReportModel>> viewSentReportsResult;
  late Either<Failures, String> sendActivityNotificationResult;
  late Either<Failures, String> updateDegreesResult;
  late Either<Failures, QuizModel> addQuizResult;
  late Either<Failures, String> addProductResult;
  late Either<Failures, String> addActivityResult;
  late void addAllQuestionsResult;

  Future<void> adminLogin({
    required String email,
    required String admin_password,
    required String type,
  }) async {
    emit(AdminLoading());

    loginResult = await adminRepo.adminLogin(
      email: email,
      admin_password: admin_password,
      type: type,
    );

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

  Future<void> viewAdminSentReports() async {
    emit(AdminLoading());

    viewSentReportsResult = await adminRepo.viewAdminSentReports();

    viewSentReportsResult.fold(
      (failure) {
        emit(AdminFailure(failure.errMessage));
      },
      (reports) {
        emit(ViewSentReportsSuccess(reports));
      },
    );
  }

  Future<void> sendActivityNotification({
    required String activity_an,
    required String content,
  }) async {
    emit(AdminLoading());

    sendReportResult = await adminRepo.sendActivityNotification(
      activity_an: activity_an,
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

  Future<void> approveSubject({
    required String as_id,
  }) async {
    emit(AdminLoading());

    sendReportResult = await adminRepo.approveSubject(
      as_id: as_id,
    );

    sendReportResult.fold(
      (failures) {
        emit(AdminFailure(failures.errMessage));
      },
      (message) {
        emit(
          ApproveSubjectSuccess(message),
        );
      },
    );
  }

  Future<void> updateDegrees({
    required String subject_degree,
    required String std_degree,
    required String final_degree,
    required String mid,
    required String practical,
  }) async {
    emit(AdminLoading());

    updateDegreesResult = await adminRepo.updateDegrees(
      subject_degree: subject_degree,
      std_degree: std_degree,
      final_degree: final_degree,
      mid: mid,
      practical: practical,
    );

    updateDegreesResult.fold(
      (failures) {
        emit(AdminFailure(failures.errMessage));
      },
      (message) {
        emit(
          UpdateDegreesSuccess(message),
        );
      },
    );
  }

  Future<void> addQuiz({
    required String name,
    required String sub_quiz,
  }) async {
    emit(AdminLoading());

    addQuizResult = await adminRepo.addQuiz(
      name: name,
      sub_quiz: sub_quiz,
    );

    addQuizResult.fold(
      (failures) {
        emit(AdminFailure(failures.errMessage));
      },
      (quizModel) {
        emit(
          AddQuizSuccess(quizModel),
        );
      },
    );
  }

  Future<void> addAllQuestions({
    required String question_quiz,
    required List<QuestionModel> questions,
  }) async {
    emit(AdminLoading());

    try {
      addAllQuestionsResult = await adminRepo.addAllQuestions(
        question_quiz: question_quiz,
        questions: questions,
      );
      emit(const AddAllQuestionsSuccess('Questions added successfully'));
    } catch (e) {
      log('Error in addAllQuestions: $e');
      emit(const AdminFailure('Failed to add questions'));
      return;
    }
  }

  Future<void> addProduct({
    required String product_name,
    required String product_category,
    required String product_price,
    required File product_image,
  }) async {
    emit(AdminLoading());

    addProductResult = await adminRepo.addProduct(
      product_name: product_name,
      product_category: product_category,
      product_price: product_price,
      product_image: product_image,
    );

    addProductResult.fold(
      (failures) {
        emit(AdminFailure(failures.errMessage));
      },
      (message) {
        emit(
          AddProductSuccess(message),
        );
      },
    );
  }

  Future<void> addActivity({
    required String name,
    required String description,
    required String price,
    required File image,
  }) async {
    emit(AdminLoading());

    addActivityResult = await adminRepo.addActivity(
      name: name,
      description: description,
      price: price,
      image: image,
    );

    addActivityResult.fold(
      (failures) {
        emit(AdminFailure(failures.errMessage));
      },
      (message) {
        emit(
          AddActivitySuccess(message),
        );
      },
    );
  }

   Future<void> viewAllOrders() async {
    emit(AdminLoading());

    final viewAllOrders = await adminRepo.viewAllOrders();

    viewAllOrders.fold(
      (failure) {
        emit(AdminFailure(failure.errMessage));
      },
      (orders) {
        emit(ViewAllOrdersSuccess(orders));
      },
    );
  }
}
