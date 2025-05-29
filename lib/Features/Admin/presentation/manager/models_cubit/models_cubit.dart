import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/models/activity_model.dart';
import 'package:nexura/Core/models/product_model.dart';
import 'package:nexura/Core/widgets/custom_snackbar.dart';

import '../../../../../Core/errors/failures.dart';
import '../../../../../Core/models/grade_model.dart';
import '../../../../../Core/models/subject_model.dart';
import '../../../../Student/data/repo/student_repo.dart';
import '../../../data/repo/admin_repo.dart';

part 'models_state.dart';

class ModelsCubit extends Cubit<ModelsState> {
  ModelsCubit(this.adminRepo, this.studentRepo) : super(ModelsInitial());

  final AdminRepo adminRepo;
  final StudentRepo studentRepo;

  late Either<Failures, List<ActivityModel>> activitiesResult;

  late Either<Failures, List<GradeModel>> gradesResult;

  late Either<Failures, List<SubjectModel>> subjectsResult;

  late Either<Failures, List<ProductModel>> productsResult;

  List<ProductModel> shoppingCart = [];

  Future<void> viewActivities() async {
    emit(ModelsLoading());

    activitiesResult = await adminRepo.viewActivities();

    activitiesResult.fold(
      (failure) {
        emit(ModelsFailure(failure.errMessage));
      },
      (activities) {
        emit(ActivitiesSuccess(activities));
      },
    );
  }

  Future<void> viewApprovmentSubjects() async {
    emit(ModelsLoading());

    subjectsResult = await adminRepo.viewApprovmentSubject();

    subjectsResult.fold(
      (failure) {
        emit(ModelsFailure(failure.errMessage));
      },
      (subjects) {
        emit(SubjectsSuccess(subjects));
      },
    );
  }

  Future<void> viewSubjects({required String sub_grade}) async {
    emit(ModelsLoading());

    subjectsResult = await adminRepo.viewSubjects(sub_grade: sub_grade);

    subjectsResult.fold(
      (failure) {
        emit(ModelsFailure(failure.errMessage));
      },
      (subjects) {
        emit(SubjectsSuccess(subjects));
      },
    );
  }

  Future<void> viewGrades() async {
    emit(ModelsLoading());

    gradesResult = await adminRepo.viewGrades();

    gradesResult.fold(
      (failure) {
        emit(ModelsFailure(failure.errMessage));
      },
      (grades) {
        emit(GradesSuccess(grades));
      },
    );
  }

  Future<void> viewProducts({required String product_category}) async {
    emit(ModelsLoading());

    productsResult =
        await studentRepo.viewProducts(product_category: product_category);

    productsResult.fold(
      (failure) {
        emit(ModelsFailure(failure.errMessage));
      },
      (products) {
        emit(ProductsSuccess(products));
      },
    );
  }

  void viewShoppingCart() {
    emit(ShoppingCartUpdated(shoppingCart));
  }

  void addToShoppingCart(ProductModel product, context) {
    try {
      shoppingCart.add(product);
      log('Product added to shopping cart: ${product.productName}');
      log('Shopping cart: ${shoppingCart.map((e) => e.productName).join(', ')}');
      kShowSnackBar(context, '${product.productName} added to shopping cart');
      //emit(ShoppingCartUpdated(shoppingCart));
    } catch (e) {
      log('Error adding product to shopping cart: $e');
      kShowSnackBar(context, 'Error adding product to shopping cart');
      return;
    }
  }

  void removeFromShoppingCart(ProductModel product, context) {
    try {
      shoppingCart.remove(product);
      log('Product removed from shopping cart: ${product.productName}');
      log('Shopping cart: ${shoppingCart.map((e) => e.productName).join(', ')}');
      kShowSnackBar(
          context, '${product.productName} removed from shopping cart');
      emit(ShoppingCartUpdated(shoppingCart));
    } catch (e) {
      log('Error removing product from shopping cart: $e');
      kShowSnackBar(context, 'Error removing product from shopping cart');
      return;
    }
  }

  void resetShoppingCart() {
    shoppingCart = [];
    //emit(ShoppingCartUpdated(shoppingCart));
  }
}
