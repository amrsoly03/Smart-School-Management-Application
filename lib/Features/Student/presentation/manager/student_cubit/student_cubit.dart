import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/models/order_model.dart';
import 'package:nexura/Core/models/product_model.dart';
import 'package:nexura/Features/Student/data/repo/student_repo.dart';
import 'package:nexura/main.dart';

import '../../../../../Core/models/degree_model.dart';
import '../../../../../Core/models/question_model.dart';
import '../../../../../Core/models/quiz_model.dart';
import '../../../data/models/student_model.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit(this.studentRepo) : super(StudentInitial());

  final StudentRepo studentRepo;

  late void addOrderProductsResult;

  List<Map<String, String>> choosenAnswers = [];

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

  Future<void> viewDegrees({required String std_degree}) async {
    emit(StudentLoading());

    final degreesResult = await studentRepo.viewDegrees(
      std_degree: std_degree,
    );

    degreesResult.fold(
      (failures) {
        emit(StudentFailure(failures.errMessage));
      },
      (degrees) {
        emit(StudentDegreesSuccess(degrees));
      },
    );
  }

  Future<void> viewStudentQuizzes() async {
    emit(StudentLoading());

    final quizzesResult = await studentRepo.viewStudentQuizzes(
      student_id: sharedPref.getString('user_id')!,
    );

    quizzesResult.fold(
      (failures) {
        emit(StudentFailure(failures.errMessage));
      },
      (quizzes) {
        emit(StudentQuizzesSuccess(quizzes));
      },
    );
  }

  Future<void> viewQuizQuestions({required String question_quiz}) async {
    emit(StudentLoading());

    final questionsResult = await studentRepo.viewQuizQuestions(
      question_quiz: question_quiz,
    );

    questionsResult.fold(
      (failures) {
        emit(StudentFailure(failures.errMessage));
      },
      (questions) {
        emit(QuizQuestionsSuccess(questions));
      },
    );
  }

  Future<void> viewSchedule() async {
    emit(StudentLoading());

    final scheduleResult = await studentRepo.viewSchedule(
      grade_id: sharedPref.getString('student_grade')!,
    );

    scheduleResult.fold(
      (failures) {
        emit(StudentFailure(failures.errMessage));
      },
      (scheduleImage) {
        emit(StudentScheduleSuccess(scheduleImage));
      },
    );
  }

  Future<void> submitQuiz({
    required String qd_quiz,
  }) async {
    emit(StudentLoading());

    final submitResult = await studentRepo.submitQuiz(
      qd_student: sharedPref.getString('user_id')!,
      qd_quiz: qd_quiz,
    );

    submitResult.fold(
      (failures) {
        emit(StudentFailure(failures.errMessage));
      },
      (message) {
        emit(SubmitQuizSuccess(message));
      },
    );
  }

  Future<void> increasePracticalDegree({
    required String subject_degree,
    required String increase_by,
  }) async {
    emit(StudentLoading());

    final submitResult = await studentRepo.increasePracticalDegree(
      std_degree: sharedPref.getString('user_id')!,
      subject_degree: subject_degree,
      increase_by: increase_by,
    );

    submitResult.fold(
      (failures) {
        //emit(StudentFailure(failures.errMessage));
      },
      (message) {
        emit(SubmitQuizSuccess(message));
      },
    );
  }

  Future<void> subscribeActivity({
    required String student_as,
    required String activity_as,
  }) async {
    emit(StudentLoading());

    final subscribeResult = await studentRepo.subscribeActivity(
      student_as: student_as,
      activity_as: activity_as,
    );

    subscribeResult.fold(
      (failures) {
        emit(StudentFailure(failures.errMessage));
      },
      (message) {
        emit(SubscribeActivitySuccess(message));
      },
    );
  }

  Future<void> addOrder() async {
    emit(StudentLoading());

    final addOrderResult = await studentRepo.addOrder(
      order_student: sharedPref.getString('user_id')!,
    );

    addOrderResult.fold(
      (failures) {
        emit(StudentFailure(failures.errMessage));
      },
      (order) {
        emit(AddOrderSuccess(order));
      },
    );
  }

  Future<void> addOrderProducts({
    required String op_order,
    required List<ProductModel> products,
  }) async {
    emit(StudentLoading());

    try {
      addOrderProductsResult = await studentRepo.addOrderProducts(
        op_order: op_order,
        products: products,
      );
      emit(const AddOrderProductsSuccess('Questions added successfully'));
    } catch (e) {
      log('Error in addOrderProducts: $e');
      emit(const StudentFailure('Failed to add questions'));
      return;
    }
  }

  void addAnswer(String questionId, String answer) {
    choosenAnswers.add(
      {'questionId': questionId, 'answer': answer},
    );
  }
}
