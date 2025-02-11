import 'package:go_router/go_router.dart';
import 'package:ui_telemedicine_app/presentation/pages/chat/chat_page.dart';
import 'package:ui_telemedicine_app/presentation/pages/dashboard/dashboard_page.dart';
import 'package:ui_telemedicine_app/presentation/pages/doctor_details/doctor_details_page.dart';
import 'package:ui_telemedicine_app/presentation/pages/home/home_page.dart';
import 'package:ui_telemedicine_app/presentation/pages/profile/profile_page.dart';
import 'package:ui_telemedicine_app/presentation/pages/search_results/search_results_page.dart';

abstract final class AppRoutes {
  static const String home = '/';
  static const String chat = '/chat';
  static const String profile = '/profile';
  static const String search = '/search_results';
  static const ({String name, String path}) doctorDetails = (
    name: 'doctor_details',
    path: '/doctor_details/:id',
  );
}

// GoRouter configuration
final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => DashboardPage(
        key: state.pageKey,
        child: child,
      ),
      routes: [
        GoRoute(
          path: AppRoutes.home,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: HomePage(
                key: state.pageKey,
              ),
            );
          },
        ),
        GoRoute(
          path: AppRoutes.search,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: SearchResultsPage(
                key: state.pageKey,
              ),
            );
          },
        ),
        GoRoute(
          path: AppRoutes.chat,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: ChatPage(
                key: state.pageKey,
              ),
            );
          },
        ),
        GoRoute(
          path: AppRoutes.profile,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: ProfilePage(
                key: state.pageKey,
              ),
            );
          },
        ),
      ],
    ),
    GoRoute(
      name: AppRoutes.doctorDetails.name,
      path: AppRoutes.doctorDetails.path,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return DoctorDetailsPage(
          key: state.pageKey,
          id: id,
        );
      },
    ),
  ],
);
