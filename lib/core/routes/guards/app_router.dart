import 'package:clean_arch/core/constants/route_constants.dart';
import 'package:clean_arch/core/widgets/splash_screen.dart';
import 'package:clean_arch/features/auth/presentation/login_page.dart';
import 'package:clean_arch/features/product/presentation/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: 'splash',
      path: RouteConstants.splashRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      name: 'loginPage',
      path: RouteConstants.loginRoute,
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage();
      },
    ),
    GoRoute(
      name: 'homePage',
      path: RouteConstants.profileRoute,
      builder: (BuildContext context, GoRouterState state) {
        return  HomePage();
      },
    ),
  ],
);
