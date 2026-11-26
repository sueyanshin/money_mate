import 'package:go_router/go_router.dart';
import 'package:money_mate/app.dart';
import 'package:money_mate/features/auth/pages/login_page.dart';
import 'package:money_mate/features/auth/pages/signup_page.dart';
import 'package:money_mate/features/dashboard/home_page.dart';
import 'package:money_mate/features/profile/profile_page.dart';
import 'package:money_mate/features/reports/report_page.dart';
import 'package:money_mate/features/transactions/add_transaction_page.dart';
import 'package:money_mate/features/transactions/transcations_page.dart';
import 'package:money_mate/core/router/go_router_refresh_stream.dart';
import 'package:money_mate/main.dart';
import 'package:money_mate/services/auth_service.dart';

class AppRouter {
  static final AuthService _authService = sl<AuthService>();
  static final GoRouter router = GoRouter(
    initialLocation: "/home",
    refreshListenable: GoRouterRefreshStream(_authService.authStateChanges),
    redirect: (context, state) {
      final isLoggedIn = _authService.currentUser != null;
      final isAuthRoute =
          state.matchedLocation == "/login" ||
          state.matchedLocation == "/signup";

      // not logged in
      if (!isLoggedIn && !isAuthRoute) {
        return "/login";
      }

      // already logged in
      if (isLoggedIn && isAuthRoute) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/signup', builder: (context, state) => const SignupPage()),
      GoRoute(
        path: '/add-transaction',
        builder: (context, state) => AddTransactionPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return App(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/home', builder: (context, state) => HomePage()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/transactions',
                builder: (context, state) => TranscationsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/reports',
                builder: (context, state) => ReportPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => ProfilePage(),
              ),
            ],
          ),
          // StatefulShellBranch(
          //   routes: [
          //     GoRoute(
          //       path: '/add-transaction',
          //       builder: (context, state) => AddTransactionPage(),
          //     ),
          //   ],
          // ),
        ],
      ),
    ],
  );
}
