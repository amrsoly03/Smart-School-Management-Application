import 'package:go_router/go_router.dart';
import 'package:nexura/Features/Admin/presentation/views/admin_home_view.dart';
import 'package:nexura/Features/Parent/presentation/views/parent_home_view.dart';
import 'package:nexura/Features/Student/presentation/views/student_home_view.dart';

import '../../Features/Auth/presentation/views/login_view.dart';
import '../../first_screen.dart';




abstract class AppRouter {

  //static const kSplashScreen = '/SplashScreen';
  static const kLoginView = '/LoginView';
  static const kAdminHomeView = '/AdminHomeView';
  static const kStudentHomeView = '/StudentHomeView';
  static const kParentHomeView = '/ParentHomeView';

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
      GoRoute(
        path: kAdminHomeView,
        builder: (context, state) => const AdminHomeView(),
      ),
      GoRoute(
        path: kStudentHomeView,
        builder: (context, state) => const StudentHomeView(),
      ),
      GoRoute(
        path: kParentHomeView,
        builder: (context, state) => const ParentHomeView(),
      ),
      // GoRoute(
      //   path: kLoginView,
      //   builder: (context, state) => LoginView(),
      // ),
    ],
  );
}
