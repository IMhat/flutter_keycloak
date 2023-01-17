import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/login(keycloak)/login_screen.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.magento, 'Cuadro Animado', const LoginScreen()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
