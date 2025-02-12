import 'package:go_router/go_router.dart';
import 'package:nexura/Features/Auth/presentation/views/login_view.dart';
import 'package:nexura/first_screen.dart';

abstract class AppRouter {
  //static const kSplashScreen = '/SplashScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LoginView(),
      ),
      // GoRoute(
      //   path: kLoginView,
      //   builder: (context, state) => LoginView(),
      // ),
    ],
  );
}
