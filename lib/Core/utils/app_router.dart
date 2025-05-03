import 'package:go_router/go_router.dart';
import 'package:nexura/Features/Admin/presentation/views/activities_notification_view.dart';
import 'package:nexura/Features/Admin/presentation/views/add_degree_view.dart';
import 'package:nexura/Features/Admin/presentation/views/add_exam_view.dart';
import 'package:nexura/Features/Admin/presentation/views/admin_home_view.dart';
import 'package:nexura/Features/Admin/presentation/views/approve_subject_view.dart';
import 'package:nexura/Features/Admin/presentation/views/send_report_view.dart';
import 'package:nexura/Features/Admin/presentation/views/sent_reports_view.dart';
import 'package:nexura/Features/Parent/presentation/views/parent_home_view.dart';
import 'package:nexura/Features/Student/presentation/views/student_home_view.dart';

import '../../Features/Admin/presentation/views/create_account_view.dart';
import '../../Features/Admin/presentation/views/edit_user_view.dart';
import '../../Features/Auth/presentation/views/login_view.dart';
import '../../first_screen.dart';

abstract class AppRouter {
  //static const kSplashScreen = '/SplashScreen';
  static const kLoginView = '/LoginView';
  static const kAdminHomeView = '/AdminHomeView';
  static const kStudentHomeView = '/StudentHomeView';
  static const kParentHomeView = '/ParentHomeView';
  static const kCreateAccountView = '/CreateAccountView';
  static const kEditUserView = '/EditUserView';
  static const kApproveSubjectView = '/ApproveSubjectView';
  static const kAddDegreeView = '/AddDegreeView';
  static const kAddExamView = '/AddExamView';
  static const kSendReportView = '/SendReportView';
  static const kSentReportsView = '/SentReportsView';
  static const kActivitiesNotificationView = '/ActivitiesNotificationView';

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
      GoRoute(
        path: kCreateAccountView,
        builder: (context, state) => CreateAccountView(),
      ),
      GoRoute(
        path: kEditUserView,
        builder: (context, state) => const EditUserView(),
      ),
      GoRoute(
        path: kApproveSubjectView,
        builder: (context, state) => const ApproveSubjectView(),
      ),
      GoRoute(
        path: kAddDegreeView,
        builder: (context, state) => const AddDegreeView(),
      ),
      GoRoute(
        path: kAddExamView,
        builder: (context, state) => const AddExamView(),
      ),
      GoRoute(
        path: kSendReportView,
        builder: (context, state) => const SendReportView(),
      ),
      GoRoute(
        path: kSentReportsView,
        builder: (context, state) => const SentReportsView(),
      ),
      GoRoute(
        path: kActivitiesNotificationView,
        builder: (context, state) => const ActivitiesNotificationView(),
      ),
      
    ],
  );
}
