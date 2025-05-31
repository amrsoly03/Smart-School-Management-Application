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

final class SendReportSuccess extends ParentState {
  final String message;

  const SendReportSuccess(this.message);
}

final class ViewSentReportsSuccess extends ParentState {
  final List<ReportModel> reports;

  const ViewSentReportsSuccess(this.reports);
}

final class ViewCoinsSuccess extends ParentState {
  final int coins;

  const ViewCoinsSuccess(this.coins);
}

final class ViewPreviousTransactionsSuccess extends ParentState {
  final List<OrderModel> orders;

  const ViewPreviousTransactionsSuccess(this.orders);
}

final class ViewOrderProductsSuccess extends ParentState {
  final List<ProductModel> products;

  const ViewOrderProductsSuccess(this.products);
}

final class ChargeCoinsSuccess extends ParentState {
  final String message;

  const ChargeCoinsSuccess(this.message);
}

final class PayFeesSuccess extends ParentState {
  final String message;

  const PayFeesSuccess(this.message);
}

final class ApproveOrderSuccess extends ParentState {
  final String message;

  const ApproveOrderSuccess(this.message);
}

final class ViewApproveActivitiesSuccess extends ParentState {
  final List<ActivityModel> activities;

  const ViewApproveActivitiesSuccess(this.activities);
}

final class ApproveActivitySuccess extends ParentState {
  final String message;

  const ApproveActivitySuccess(this.message);
}