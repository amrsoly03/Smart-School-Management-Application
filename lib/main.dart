import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Features/Admin/presentation/manager/models_cubit/models_cubit.dart';
import 'package:nexura/Features/Admin/presentation/manager/select_models_cubit/select_models_cubit.dart';
import 'package:nexura/Features/Parent/presentation/manager/parent_cubit/parent_cubit.dart';
import 'package:nexura/Features/Student/data/repo/student_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Core/utils/app_router.dart';
import 'Core/utils/bloc_observer.dart';
import 'Core/utils/service_locator.dart';
import 'Core/utils/size_config.dart';
import 'Core/utils/theme.dart';
import 'Features/Admin/data/repo/admin_repo_impl.dart';
import 'Features/Admin/presentation/manager/admin_cubit/admin_cubit.dart';
import 'Features/Admin/presentation/manager/questions_cubit/questions_cubit.dart';
import 'Features/Parent/data/repo/parent_repo_impl.dart';
import 'Features/Student/presentation/manager/student_cubit/student_cubit.dart';

late SharedPreferences sharedPref;

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  SimpleBlocObserver().onChange;
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<AdminCubit>(
          create: (context) => AdminCubit(getIt.get<AdminRepoImpl>()),
        ),
        BlocProvider<ModelsCubit>(
          create: (context) => ModelsCubit(
            getIt.get<AdminRepoImpl>(),
            getIt.get<StudentRepoImpl>(),
          ),
        ),
        BlocProvider<SelectModelsCubit>(
          create: (context) => SelectModelsCubit(),
        ),
        BlocProvider<QuestionsCubit>(
          create: (context) => QuestionsCubit(getIt.get<AdminRepoImpl>()),
        ),
        BlocProvider<StudentCubit>(
          create: (context) => StudentCubit(getIt.get<StudentRepoImpl>()),
        ),
        BlocProvider<ParentCubit>(
          create: (context) => ParentCubit(getIt.get<ParentRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: background,
        ),
      ),
    );
  }
}
