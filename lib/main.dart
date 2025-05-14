import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Features/Admin/presentation/manager/models_cubit/models_cubit.dart';
import 'package:nexura/Features/Admin/presentation/manager/select_models_cubit/select_models_cubit.dart';

import 'Core/utils/app_router.dart';
import 'Core/utils/bloc_observer.dart';
import 'Core/utils/service_locator.dart';
import 'Core/utils/size_config.dart';
import 'Core/utils/theme.dart';
import 'Features/Admin/data/repo/admin_repo_impl.dart';
import 'Features/Admin/presentation/manager/admin_cubit/admin_cubit.dart';

void main() {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
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
          create: (context) => ModelsCubit(getIt.get<AdminRepoImpl>()),
        ),
        BlocProvider<SelectModelsCubit>(
          create: (context) => SelectModelsCubit(),
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
