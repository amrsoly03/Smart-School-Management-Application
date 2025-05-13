part of 'admin_cubit.dart';

sealed class AdminCubitState extends Equatable {
  const AdminCubitState();

  @override
  List<Object> get props => [];
}

final class AdminCubitInitial extends AdminCubitState {}
