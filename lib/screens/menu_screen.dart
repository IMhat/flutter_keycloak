import 'package:flutter/material.dart';
import 'package:keycloakflutter/services/auth_service.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(AuthService.instance.profile!.name),
            Text(
              'You\'re logged in',
            ),
            OutlinedButton(
                onPressed: () {
                  AuthService.instance.logout();
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
