import 'package:go_router/go_router.dart';

import '../../Features/Auth/presentation/views/login_view.dart';
import '../../first_screen.dart';




abstract class AppRouter {

  //static const kSplashScreen = '/SplashScreen';
  static const kLoginView = '/LoginView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const FirstScreen(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => LoginView(
          user: state.extra as Users,
        ),
      ),
      // GoRoute(
      //   path: kLoginView,
      //   builder: (context, state) => LoginView(),
      // ),
    ],
  );
}
