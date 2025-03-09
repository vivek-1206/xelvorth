import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xelvorth/Features/Home/home.dart';
import 'package:xelvorth/Features/Home/homedetails.dart';
import 'package:xelvorth/Features/Home/notifications.dart';
import 'package:xelvorth/Features/ResetPasswordScreen/ResetPasswordScreen.dart';
import 'package:xelvorth/Features/otpScreen/otpScreen.dart';
import 'package:xelvorth/Features/portfolio/portfolio.dart';
import 'package:xelvorth/Features/portfolio/portfolio1.dart';
import 'package:xelvorth/Features/profile/profile.dart';
import 'package:xelvorth/Features/wallet/wallet.dart';
import 'package:xelvorth/Features/withdraw/withdraw.dart';
import 'package:xelvorth/Routes/routes_constants.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: RoutesConstants.homedetails,
      routes: <RouteBase>[
        GoRoute(
          path: RoutesConstants.resetPasswordScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const ResetPasswordScreen();
          },
        ),
        GoRoute(
          path: RoutesConstants.homescreen,
          builder: (BuildContext context, GoRouterState state) {
            return const Home();
          },
        ),
        GoRoute(
          path: RoutesConstants.portpolio1,
          builder: (BuildContext context, GoRouterState state) {
            return const Portfolio1();
          },
        ),
        GoRoute(
          path: RoutesConstants.notification,
          builder: (BuildContext context, GoRouterState state) {
            return const Notifications();
          },
        ),
        GoRoute(
          path: RoutesConstants.homedetails,
          builder: (BuildContext context, GoRouterState state) {
            return const Homedetails();
          },
        ),
        GoRoute(
          path: RoutesConstants.portpolio,
          builder: (BuildContext context, GoRouterState state) {
            return const Portfolio();
          },
        ),
        GoRoute(
          path: RoutesConstants.walletScreen,
          builder: (BuildContext context, GoRouterState state) {
            return WalletScreen();
          },
        ),
        GoRoute(
          path: RoutesConstants.profilescreen,
          builder: (BuildContext context, GoRouterState state) {
            return ProfileScreen();
          },
        ),
        GoRoute(
          path: RoutesConstants.otpScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const OtpScreen();
          },
        ),
        GoRoute(
          path: RoutesConstants.withdrawScreen,
          builder: (BuildContext context, GoRouterState state) {
            return WithdrawScreen();
          },
        ),
      ],
      errorBuilder: (BuildContext context, GoRouterState state) {
        return const Scaffold(
          body: Center(
            child: Text('Error'),
          ),
        );
      });
}
