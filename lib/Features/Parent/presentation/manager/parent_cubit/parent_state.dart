part of 'parent_cubit.dart';

sealed class ParentState extends Equatable {
  const ParentState();

  @override
  List<Object> get props => [];
}

final class ParentInitial extends ParentState {}

final class ParentLoading extends ParentState {}

final class ParentFailure extends ParentState {
  final String errMessage;

  const ParentFailure(this.errMessage);
}

final class ParentLoginSuccess extends ParentState {
  final ParentModel parentModel;

  const ParentLoginSuccess(this.parentModel);
}
