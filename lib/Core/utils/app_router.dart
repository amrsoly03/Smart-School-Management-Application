import 'package:go_router/go_router.dart';
import 'package:nexura/Features/Admin/presentation/views/admin_home_view.dart';
import 'package:nexura/Features/Auth/presentation/views/login_view.dart';

import '../../Features/Student/presentation/views/activity_details_view.dart';

abstract class AppRouter {
  //static const kSplashScreen = '/SplashScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => ActivityDetailsView(),
      ),
      // GoRoute(
      //   path: kLoginView,
      //   builder: (context, state) => LoginView(),
      // ),
    ],
  );
}
