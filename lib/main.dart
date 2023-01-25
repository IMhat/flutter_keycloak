import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keycloakflutter/providers/user_provider.dart';
import 'package:keycloakflutter/router.dart';
import 'package:keycloakflutter/router/app_routes.dart';
import 'package:keycloakflutter/screens/hakim/controllers/tts.dart';
import 'package:keycloakflutter/screens/login(keycloak)/check_onboarding.dart';
import 'package:keycloakflutter/screens/login(keycloak)/service/notifications_service.dart';
import 'package:keycloakflutter/shared/preferences.dart';
import 'package:keycloakflutter/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'login(JWT)/screens/initial_screen.dart';
import 'login(JWT)/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  await Preferences.init();
  await TextToSpeech.initTTS();

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeChanger(ThemeData.dark(), 1)),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
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
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    final currenTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)),
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
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: NotificationsService.messengerKey,
        title: 'The Co Creator',
        // theme: currenTheme,
        onGenerateRoute: (settings) => generateRoute(settings),
        routes: AppRoutes.getAppRoutes(),
        home: LoginPage());
  }
}
