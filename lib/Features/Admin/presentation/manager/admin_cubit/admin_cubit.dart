import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'admin_state.dart';

class AdminCubitCubit extends Cubit<AdminCubitState> {
  AdminCubitCubit() : super(AdminCubitInitial());
}
