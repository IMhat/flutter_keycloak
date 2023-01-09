import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            LoginButton(),
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // AuthService.instance.init();
    super.initState();
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        final result = await AuthService.instance.login();

        if (result != 'SUCCESS') {
          final snackBar = SnackBar(
            content: Text(result),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: const Text("Login or Signup"),
    );
  }
}
