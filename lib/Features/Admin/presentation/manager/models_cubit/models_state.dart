part of 'models_cubit.dart';

sealed class ModelsState extends Equatable {
  const ModelsState();

  @override
  List<Object> get props => [];
}

final class ModelsInitial extends ModelsState {}

final class ModelsLoading extends ModelsState {}

final class ModelsFailure extends ModelsState {
  final String errMessage;

  const ModelsFailure(this.errMessage);
}

final class ActivitiesSuccess extends ModelsState {
  final List<ActivityModel> activities;

  const ActivitiesSuccess(this.activities);
}

final class SubjectsSuccess extends ModelsState {
  final List<SubjectModel> subjects;

  const SubjectsSuccess(this.subjects);
}

final class GradesSuccess extends ModelsState {
  final List<GradeModel> grades;

  const GradesSuccess(this.grades);
}

final class ProductsSuccess extends ModelsState {
  final List<ProductModel> products;

  const ProductsSuccess(this.products);
}

final class ShoppingCartUpdated extends ModelsState {
  final List<ProductModel> shoppingCart;

  const ShoppingCartUpdated(this.shoppingCart);
}
