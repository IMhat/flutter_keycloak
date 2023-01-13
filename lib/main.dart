import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keycloakflutter/router.dart';
import 'package:keycloakflutter/screens/login/check_auth_screen.dart';
import 'package:keycloakflutter/screens/login/check_onboarding.dart';

import 'package:keycloakflutter/screens/login/service/auth_service.dart';
import 'package:keycloakflutter/screens/login/service/helper/is_debug.dart';

import 'package:keycloakflutter/screens/login/service/notifications_service.dart';

import 'package:keycloakflutter/shared/preferences.dart';
import 'package:keycloakflutter/theme/theme.dart';
import 'package:keycloakflutter/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Future<void> main() async {
//   runZonedGuarded<Future<void>>(() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await Preferences.init();

//     await SystemChrome.setPreferredOrientations(
//       [DeviceOrientation.portraitUp],
//     );

//     await AuthService.instance.init();

//     runApp(MultiProvider(
//         providers: [
//           ChangeNotifierProvider(
//               create: (_) => ThemeChanger(ThemeData.dark(), 1))
//         ],
//         child: MaterialApp.router(
//           // builder: (context, child) => ResponsiveWrapper.builder(
//           //   child,
//           //   maxWidth: 1200,
//           //   minWidth: 480,
//           //   defaultScale: true,
//           //   breakpoints: [
//           //     const ResponsiveBreakpoint.resize(450, name: MOBILE),
//           //     const ResponsiveBreakpoint.autoScale(800, name: TABLET),
//           //     const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
//           //   ],
//           // ),
//           scaffoldMessengerKey: NotificationsService.messengerKey,
//           // title: 'The Co Creator',
//           // theme: currenTheme,
//           routeInformationParser: router.routeInformationParser,
//           routerDelegate: router.routerDelegate,
//           debugShowCheckedModeBanner: false,
//         )));
//   }, (error, stackTrace) async {
//     print('Caught Dart Error!');
//     print('$error');
//     print('$stackTrace');
//   });

//   FlutterError.onError = (FlutterErrorDetails details) async {
//     final dynamic exception = details.exception;
//     final StackTrace? stackTrace = details.stack;

//     if (isInDebugMode) {
//       print('caught Frameword Error!');

//       FlutterError.dumpErrorToConsole(details);
//     } else {
//       Zone.current.handleUncaughtError(exception, stackTrace!);
//     }
//   };
// }
Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Preferences.init();

    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );

    await AuthService.instance.init();

    runApp(const AppState());
  }, (error, stackTrace) async {
    print('Caught Dart Error!');
    print('$error');
    print('$stackTrace');
  });
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeChanger(ThemeData.dark(), 1)),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final currenTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp.router(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),

      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      title: 'The Co Creator',
      theme: currenTheme,
      // onGenerateRoute: (settings) => generateRoute(settings),
      // routes: AppRoutes.getAppRoutes(),
      //home: const CheckAuthScreen());
      // home: const MyHomePage(title: 'The Co Creator')
    );
  }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.

//   // @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //     title: 'Flutter Demo',
//   //     theme: ThemeData(
//   //       primarySwatch: Colors.blue,
//   //     ),
//   //     home: const MyHomePage(title: 'Flutter Demo Home Page'),
//   //   );
//   // }
//   @override
//   Widget build(BuildContext context) {
//     final currenTheme = Provider.of<ThemeChanger>(context).currentTheme;
//     return MaterialApp(
//         builder: (context, child) => ResponsiveWrapper.builder(
//               child,
//               maxWidth: 1200,
//               minWidth: 480,
//               defaultScale: true,
//               breakpoints: [
//                 const ResponsiveBreakpoint.resize(450, name: MOBILE),
//                 const ResponsiveBreakpoint.autoScale(800, name: TABLET),
//                 const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
//               ],
//             ),
//         debugShowCheckedModeBanner: false,
//         scaffoldMessengerKey: NotificationsService.messengerKey,
//         title: 'The Co Creator',
//         theme: currenTheme,
//         // onGenerateRoute: (settings) => generateRoute(settings),
//         // routes: AppRoutes.getAppRoutes(),
//         //home: const CheckAuthScreen());
//         home: const MyHomePage(title: 'The Co Creator'));
//   }
// }

// // class _MyAppState extends State<MyApp> {
// //   @override
// //   Widget build(BuildContext context) {
// //     final currenTheme = Provider.of<ThemeChanger>(context).currentTheme;
// //     return MaterialApp(
// //         builder: (context, child) => ResponsiveWrapper.builder(
// //               child,
// //               maxWidth: 1200,
// //               minWidth: 480,
// //               defaultScale: true,
// //               breakpoints: [

// //                 const ResponsiveBreakpoint.resize(450, name: MOBILE),
// //                 const ResponsiveBreakpoint.autoScale(800, name: TABLET),
// //                 const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
// //               ],
// //             ),
// //         debugShowCheckedModeBanner: false,
// //         scaffoldMessengerKey: NotificationsService.messengerKey,
// //         title: 'The Co Creator',
// //         theme: currenTheme,
// //         // onGenerateRoute: (settings) => generateRoute(settings),
// //         // routes: AppRoutes.getAppRoutes(),
// //         home: const MyHomePage(title: 'Flutter Demo Home Page'));
// //   }
// // }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     //++++++++++++++++++++++++++++++++++++++++++++++++
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),

//       // body: Center(
//       //   child: Column(
//       //     mainAxisAlignment: MainAxisAlignment.center,
//       //     children: <Widget>[
//       //       const Text(
//       //         'You have pushed the button this many times:',
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     );
//   }
// }
}
