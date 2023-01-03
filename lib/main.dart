import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uas_1972025/pages/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uas_1972025/pages/login_page.dart';
import 'package:uas_1972025/pages/register_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: "/login",
        name: "login",
        builder: (context, state) {
          return const SignInPage();
        }),
    GoRoute(
      path: "/main",
      name: 'main',
      builder: (context, state) {
        return MainPage();
      },
    ),
    GoRoute(
      path: "/registerpage",
      name: "registerpage",
      builder: (context, state) {
        return const RegisterPage();
      },
    ),
  ], initialLocation: '/login', debugLogDiagnostics: true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
