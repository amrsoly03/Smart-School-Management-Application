import 'package:go_router/go_router.dart';
import 'package:nexura/Features/Admin/presentation/views/activities_notification_view.dart';
import 'package:nexura/Features/Admin/presentation/views/add_degree_view.dart';
import 'package:nexura/Features/Admin/presentation/views/add_exam_view.dart';
import 'package:nexura/Features/Admin/presentation/views/school_admin_home_view.dart';
import 'package:nexura/Features/Admin/presentation/views/approve_subject_view.dart';
import 'package:nexura/Features/Admin/presentation/views/send_report_view.dart';
import 'package:nexura/Features/Admin/presentation/views/sent_reports_view.dart';
import 'package:nexura/Features/Parent/presentation/views/notifications_and_reports_view.dart';
import 'package:nexura/Features/Parent/presentation/views/parent_home_view.dart';
import 'package:nexura/Features/Parent/presentation/views/parent_send_report_view.dart';
import 'package:nexura/Features/Parent/presentation/views/parent_sent_reports_view.dart';
import 'package:nexura/Features/Parent/presentation/views/payment_view.dart';
import 'package:nexura/Features/Parent/presentation/views/previous_transaction_view.dart';
import 'package:nexura/Features/Parent/presentation/views/wallet_details_view.dart';
import 'package:nexura/Features/Student/presentation/views/activities_view.dart';
import 'package:nexura/Features/Student/presentation/views/activity_details_view.dart';
import 'package:nexura/Features/Student/presentation/views/cafeteria_view.dart';
import 'package:nexura/Features/Student/presentation/views/categories_view.dart';
import 'package:nexura/Features/Student/presentation/views/degrees_view.dart';
import 'package:nexura/Features/Student/presentation/views/products_view.dart';
import 'package:nexura/Features/Student/presentation/views/quiz_view.dart';
import 'package:nexura/Features/Student/presentation/views/quizzes_view.dart';
import 'package:nexura/Features/Student/presentation/views/schedule_view.dart';
import 'package:nexura/Features/Student/presentation/views/school_activities_view.dart';
import 'package:nexura/Features/Student/presentation/views/student_home_view.dart';

import '../../Features/Admin/presentation/views/admins_home_view.dart';
import '../../Features/Admin/presentation/views/create_account_view.dart';
import '../../Features/Admin/presentation/views/edit_user_view.dart';
import '../../Features/Auth/presentation/views/login_view.dart';
import '../../first_screen.dart';

abstract class AppRouter {
  //static const kSplashScreen = '/SplashScreen';
  static const kLoginView = '/LoginView';
  static const kAdminsHomeView = '/AdminsHomeView';
  static const kSchoolAdminHomeView = '/SchoolAdminHomeView';
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
  static const kSchoolActivitiesView = '/SchoolActivitiesView';
  static const kActivitiesView = '/ActivitiesView';
  static const kCafeteriaView = '/CafeteriaView';
  static const kCategoriesView = '/CategoriesView';
  static const kProductsView = '/ProductsView';
  static const kQuizzesView = '/QuizzesView';
  static const kDegreesView = '/DegreesView';
  static const kScheduleView = '/ScheduleView';
  static const kQuizView = '/QuizView';
  static const kActivityDetailsView = '/ActivityDetailsView';
  static const kWalletDetailsView = '/WalletDetailsView';
  static const kPaymentView = '/PaymentView';
  static const kPreviousTransactionView = '/PreviousTransactionView';
  static const kNotificationsAndReportsView = '/NotificationsAndReportsView';
  static const kParentSendReportView = '/ParentSendReportView';
  static const kParentSentReportsView = '/ParentSentReportsView';

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
        path: kSchoolAdminHomeView,
        builder: (context, state) => const SchoolAdminHomeView(),
      ),
      GoRoute(
        path: kAdminsHomeView,
        builder: (context, state) => const AdminsHomeView(),
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
      GoRoute(
        path: kSchoolActivitiesView,
        builder: (context, state) => const SchoolActivitiesView(),
      ),
      GoRoute(
        path: kActivitiesView,
        builder: (context, state) => const ActivitiesView(),
      ),
      GoRoute(
        path: kCafeteriaView,
        builder: (context, state) => const CafeteriaView(),
      ),
      GoRoute(
        path: kCategoriesView,
        builder: (context, state) => const CategoriesView(),
      ),
      GoRoute(
        path: kProductsView,
        builder: (context, state) => const ProductsView(),
      ),
      GoRoute(
        path: kQuizzesView,
        builder: (context, state) => const QuizzesView(),
      ),
      GoRoute(
        path: kDegreesView,
        builder: (context, state) => const DegreesView(),
      ),
      GoRoute(
        path: kScheduleView,
        builder: (context, state) => const ScheduleView(),
      ),
      GoRoute(
        path: kQuizView,
        builder: (context, state) => const QuizView(),
      ),
      GoRoute(
        path: kActivityDetailsView,
        builder: (context, state) => const ActivityDetailsView(),
      ),
      GoRoute(
        path: kWalletDetailsView,
        builder: (context, state) => const WalletDetailsView(),
      ),
      GoRoute(
        path: kPaymentView,
        builder: (context, state) => const PaymentView(),
      ),
      GoRoute(
        path: kPreviousTransactionView,
        builder: (context, state) => const PreviousTransactionView(),
      ),
      GoRoute(
        path: kNotificationsAndReportsView,
        builder: (context, state) => const NotificationsAndReportsView(),
      ),
      GoRoute(
        path: kParentSendReportView,
        builder: (context, state) => const ParentSendReportView(),
      ),
      GoRoute(
        path: kParentSentReportsView,
        builder: (context, state) => const ParentSentReportsView(),
      ),
    ],
  );
}
