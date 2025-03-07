import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xelvorth/Features/Home/home.dart';
import 'package:xelvorth/Features/Home/homedetails.dart';
import 'package:xelvorth/Features/Home/notifications.dart';
import 'package:xelvorth/Routes/routes_constants.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: RoutesConstants.homedetails,
      routes: <RouteBase>[
        GoRoute(
          path: RoutesConstants.homescreen,
          builder: (BuildContext context, GoRouterState state) {
            return const Home();
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
   
      ],
      errorBuilder: (BuildContext context, GoRouterState state) {
        return const Scaffold(
          body: Center(
            child: Text('Error'),
          ),
        );
      });
}
