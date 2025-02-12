import 'package:go_router/go_router.dart';
import 'package:nexura/Features/Student/presentation/views/products_view.dart';


import '../../Features/Admin/presentation/views/create_account_view.dart';

abstract class AppRouter {
  //static const kSplashScreen = '/SplashScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => ProductsView(),
      ),
      // GoRoute(
      //   path: kLoginView,
      //   builder: (context, state) => LoginView(),
      // ),
    ],
  );
}
