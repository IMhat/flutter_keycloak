import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/menu_option.dart';
import '../screens/home/home_screen.dart';
import '../screens/login(keycloak)/login_screen.dart';

class AppRoutes {
  static const initialRoute = 'Initial';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'Home',
        icon: Icons.manage_search_outlined,
        name: 'Home',
        screen: const HomeScreen()),
    MenuOption(
        route: 'inputs',
        icon: FontAwesomeIcons.personArrowDownToLine,
        name: 'Inputs Custom',
        screen: const LoginScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }
}
