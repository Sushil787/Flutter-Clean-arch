import 'package:clean_arch/config/app_environment.dart';
import 'package:clean_arch/core/routes/guards/app_router.dart';
import 'package:clean_arch/di/di_setup.dart';
import 'package:clean_arch/features/product/data/repository/get_product_impl.dart';
import 'package:clean_arch/features/product/domain/repository/get_product_repo.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(
      env: AppEnvironment.instance.isDev ? Environment.dev : Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clean Arch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}
