import 'package:keycloakflutter/screens/login/service/auth_service2.dart';
import 'package:flutter/material.dart';
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
          future: authService.readToken(),
          builder: ((BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) return const Text('Wait');

            Future.microtask(() {
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => snapshot.data == ''
                          ? const LoginScreen()
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
