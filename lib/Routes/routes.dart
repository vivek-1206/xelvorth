import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xelvorth/Features/Home/home.dart';
import 'package:xelvorth/Features/Home/home1/homescreen1.dart';
import 'package:xelvorth/Features/Home/homedetails.dart';
import 'package:xelvorth/Features/Home/notifications.dart';
import 'package:xelvorth/Features/ResetPasswordScreen/ResetPasswordScreen.dart';

import 'package:xelvorth/Features/kyc/kyc.dart';
import 'package:xelvorth/Features/kyc/kyc_screen.dart';
import 'package:xelvorth/Features/kyc/return_screen.dart';
import 'package:xelvorth/Features/mainscreen.dart';
import 'package:xelvorth/Features/otpScreen/otpScreen.dart';
import 'package:xelvorth/Features/portfolio/portfolio.dart';

import 'package:xelvorth/Features/profile/profile.dart';
import 'package:xelvorth/Features/splashscreen.dart';
import 'package:xelvorth/Features/wallet/wallet.dart';
import 'package:xelvorth/Features/withdraw/withdraw.dart';
import 'package:xelvorth/Routes/routes_constants.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: RoutesConstants.ReturnScreen,
      routes: <RouteBase>[
        GoRoute(
          path: RoutesConstants.splashscreen,
          builder: (BuildContext context, GoRouterState state) {
            return const Splashscreen();
          },
        ),
        GoRoute(
          path: RoutesConstants.mainscreen,
          builder: (BuildContext context, GoRouterState state) {
            return const Mainscreen();
          },
        ),
        GoRoute(
          path: RoutesConstants.homescreen1,
          builder: (BuildContext context, GoRouterState state) {
            return const Homescreen1();
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
          path: RoutesConstants.KycScreen,
          builder: (BuildContext context, GoRouterState state) {
            return  KycScreen();
          },
        ),
        GoRoute(
          path: RoutesConstants.Kyc,
          builder: (BuildContext context, GoRouterState state) {
            return Kyc();
          },
        ),
        GoRoute(
          path: RoutesConstants.ReturnScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const ReturnScreen();
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
