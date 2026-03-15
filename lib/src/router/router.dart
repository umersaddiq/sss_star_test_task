library;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/local_data/preferences/preferences_service.dart';
import '../presentation/auth/sign_in_page.dart';
import '../presentation/auth/sign_up_page.dart';
import '../presentation/home/home_page.dart';

part 'app_redirection.dart';

part 'router.g.dart';

final navigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter routerConfig(Ref ref) {
  return GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: SignUpPage.path,
    redirect: (context, state) => Redirection.redirect(context, state, ref),
    routes: [
      GoRoute(
        path: SignInPage.path,
        name: SignInPage.name,
        builder: SignInPage.builder,
      ),
      GoRoute(
        path: SignUpPage.path,
        name: SignUpPage.name,
        builder: SignUpPage.builder,
      ),
      GoRoute(
        path: HomePage.path,
        name: HomePage.name,
        builder: HomePage.builder,
      ),
    ],
  );
}
