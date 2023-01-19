import 'package:flutter/material.dart';
import 'package:keycloakflutter/screens/home/home_screen.dart';
import 'package:keycloakflutter/screens/login(keycloak)/service/auth_service.dart';

import 'package:provider/provider.dart';

import '../../widgets/bottom_bar.dart';
import 'login_screen.dart';

class CheckAuthScreen extends StatelessWidget {
  static const String routeName = '/checkauth';
  const CheckAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          // future: authService.readToken(),
          builder: ((BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) return const Text('Wait');

            Future.microtask(() {
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => snapshot.data == ''
                          ? const HomeScreen()
                          // ? const LoginScreen()
                          : const BottomBar(),
                      transitionDuration: const Duration(seconds: 0)));
            });

            return Container();
          }),
        ),
      ),
    );
  }
}
