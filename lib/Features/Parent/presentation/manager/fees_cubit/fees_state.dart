part of 'fees_cubit.dart';

sealed class FeesState extends Equatable {
  const FeesState();

  @override
  List<Object> get props => [];
}

final class FeesInitial extends FeesState {}

final class FeesFailure extends FeesState {
  final String errMessage;
  const FeesFailure(this.errMessage);
}

final class FeesDone extends FeesState {
  final String message;
  const FeesDone(this.message);
}

final class ViewFeesSuccess extends FeesState {
  final int fees;

  const ViewFeesSuccess(this.fees);
}

