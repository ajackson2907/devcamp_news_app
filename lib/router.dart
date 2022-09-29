import 'package:devcamp_news_app/home_screen.dart';
import 'package:devcamp_news_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: Routes.home.path,
  routes: [
    Routes.home,
  ],
  errorPageBuilder: (context, state) {
    // ignore: avoid_print
    print(state.error);
    return MaterialPage<void>(
      key: state.pageKey,
      child: const HomeScreen(),
    );
  },
);
