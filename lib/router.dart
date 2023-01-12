import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keycloakflutter/screens/conections/connections_screen.dart';
import 'package:keycloakflutter/screens/login/check_onboarding.dart';

import 'package:keycloakflutter/screens/login/initial_screen.dart';
import 'package:keycloakflutter/screens/login/service/auth_service.dart';

import 'package:keycloakflutter/screens/questions/question1.dart';
import 'package:keycloakflutter/screens/questions/question2.dart';
import 'package:keycloakflutter/screens/questions/question3.dart';

import 'package:keycloakflutter/widgets/bottom_bar.dart';

final router = GoRouter(
  redirect: (GoRouterState state) {
    final loggedIn = AuthService.instance.logininfo.isLoggedIn;

    final isLogging = state.location == '/initialScreen';
    final isViewed = 0;

    if (!loggedIn && !isLogging) return '/initialScreen';
    if (loggedIn && isLogging) return '/home';

    return null;
  },
  refreshListenable: AuthService.instance.logininfo,
  urlPathStrategy: UrlPathStrategy.path,
  debugLogDiagnostics: false,
  initialLocation: AuthService.instance.logininfo.isLoggedIn ? '/home' : '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        // child: HomeScreen(),
        child: InitialScreen(),
      ),
    ),
    GoRoute(
      name: 'menu',
      path: '/home',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        // child: MenuScreen(),
        // child: BottomBar(),
        child: Check(),
      ),
    ),
    GoRoute(
      name: 'ActualHome',
      path: '/actual-home',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        // child: MenuScreen(),
        child: BottomBar(),
      ),
    ),
    GoRoute(
      name: 'login',
      path: '/initialScreen',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: InitialScreen(),
      ),
    ),
    //QUESTIONS---------------------------------------!
    GoRoute(
      name: 'Question-1',
      path: '/question-1',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const Question1Screen(),
      ),
    ),
    GoRoute(
      name: 'Question-2',
      path: '/question-2',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const Question2Screen(),
      ),
    ),
    GoRoute(
      name: 'Question-3',
      path: '/question-3',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const Question3Screen(),
      ),
    ),
    //CONECTIONS-------------------------!
    GoRoute(
      name: 'Conections',
      path: '/conections',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const ConnectionsScreen(),
      ),
    ),
  ],
  errorPageBuilder: (cotext, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
);


//      onTap: () {
      //   context.go('${GoRouter.of(context).location}/details', extra: movie);
      // },

      //final Movie movie;
