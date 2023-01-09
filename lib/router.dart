import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keycloakflutter/screens/home_screen.dart';
import 'package:keycloakflutter/screens/menu_screen.dart';
import 'package:keycloakflutter/services/auth_service.dart';

final router = GoRouter(
  redirect: (GoRouterState state) {
    final loggedIn = AuthService.instance.logininfo.isLoggedIn;

    final isLogging = state.location == '/home';

    if (!loggedIn && !isLogging) return '/home';
    if (loggedIn && isLogging) return '/menu';

    return null;
  },
  refreshListenable: AuthService.instance.logininfo,
  urlPathStrategy: UrlPathStrategy.path,
  debugLogDiagnostics: false,
  initialLocation: AuthService.instance.logininfo.isLoggedIn ? '/menu' : '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: HomeScreen(),
      ),
    ),
    GoRoute(
      name: 'menu',
      path: '/menu',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: MenuScreen(),
      ),
    ),
    GoRoute(
      name: 'login',
      path: '/home',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: HomeScreen(),
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
