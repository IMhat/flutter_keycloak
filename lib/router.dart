import 'package:flutter/material.dart';
import 'package:keycloakflutter/screens/business/crear_empresas.dart';
import 'package:keycloakflutter/screens/business/formulario_crear_empresas.dart';
import 'package:keycloakflutter/screens/cashflow/cash_flow_screen.dart';
import 'package:keycloakflutter/screens/cashflow/credits.dart';
import 'package:keycloakflutter/screens/hakim/screens/speech_screen.dart';
import 'package:keycloakflutter/screens/home/home_screen.dart';
import 'package:keycloakflutter/screens/hakim/ia_screen.dart';
import 'package:keycloakflutter/screens/login(keycloak)/check_auth_screen.dart';
import 'package:keycloakflutter/screens/login(keycloak)/check_onboarding.dart';
import 'package:keycloakflutter/screens/login(keycloak)/register_screen.dart';
import 'package:keycloakflutter/screens/profile/profile_screen.dart';
import 'package:keycloakflutter/screens/questions/ia.dart';
import 'package:keycloakflutter/screens/questions/question1.dart';
import 'package:keycloakflutter/screens/questions/question2.dart';
import 'package:keycloakflutter/social%20media/social_screen.dart';
import 'package:keycloakflutter/widgets/bottom_bar.dart';

import 'login(JWT)/screens/initial_screen.dart';
import 'screens/login(keycloak)/login_screen.dart';
import 'screens/questions/question3.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => LoginPage(),
      );
    case Check.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Check(),
      );
    case OnboardingIaScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OnboardingIaScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case Question1Screen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Question1Screen(),
      );
    case Question2Screen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Question2Screen(),
      );
    // case Question3Screen.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const Question3Screen(),
    //   );

    //HAKIM
    case SpeechScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SpeechScreen(),
      );
    case IaScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const IaScreen(),
      );
    // case ConnectionsScreen.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const ConnectionsScreen(),
    //   );
    case CashFlowScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CashFlowScreen(),
      );
    case CreditsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CreditsScreen(),
      );
    case ProfileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ProfileScreen(),
      );
    case CrearEmpresasScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CrearEmpresasScreen(),
      );
    case FormCrearEmpresas.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const FormCrearEmpresas(),
      );
    // case ChatScreen.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const ChatScreen(),
    //   );
    // case AddCommentary.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const AddCommentary(),
    //   );
    case SocialScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SocialScreen(),
      );

    case RegisterScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RegisterScreen(),
      );

    case CheckAuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CheckAuthScreen(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
