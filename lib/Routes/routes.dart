import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xelvorth/Features/Home/home.dart';
import 'package:xelvorth/Features/Home/homedetails.dart';
import 'package:xelvorth/Features/Home/notifications.dart';
import 'package:xelvorth/Features/portfolio/portfolio.dart';
import 'package:xelvorth/Features/portfolio/portfolio1.dart';
import 'package:xelvorth/Features/profile/profile.dart';
import 'package:xelvorth/Features/wallet/wallet.dart';
import 'package:xelvorth/Routes/routes_constants.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: RoutesConstants.profilescreen,
      routes: <RouteBase>[
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
            return  WalletScreen();
          },
        ),
         GoRoute(
          path: RoutesConstants.profilescreen,
          builder: (BuildContext context, GoRouterState state) {
            return  ProfileScreen();
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
