import 'dart:async';

import 'package:clean_arch/core/constants/app_constants.dart';
import 'package:clean_arch/core/constants/route_constants.dart';
import 'package:clean_arch/di/di_setup.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final pref = getIt<SharedPreferences>();

  check() {
    final value = pref.getString(AppConstants.token);
    if (value != null) {
      context.go(RouteConstants.profileRoute);
    } else {
      context.go(RouteConstants.loginRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      check();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Image.network(
            "https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/09/CHANEL_THUMB_34302915-446e-4eb6-8eb1-ab1634e38378_1080x.jpg?auto=format&q=60&fit=max&w=930",
          ),
        ),
      ),
    );
  }
}
