import 'package:go_router/go_router.dart';
import 'package:nexura/Features/Admin/presentation/views/edit_user_view.dart';
import 'package:nexura/Features/Auth/presentation/views/login_view.dart';

abstract class AppRouter {
  //static const kSplashScreen = '/SplashScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => EditUserView(),
      ),
      // GoRoute(
      //   path: kLoginView,
      //   builder: (context, state) => LoginView(),
      // ),
    ],
  );
}
