import 'package:keycloakflutter/screens/login/widget/button_initial.dart';
import 'package:flutter/material.dart';
//import 'package:rive/rive.dart';

class InitialScreen extends StatelessWidget {
  static const String routeName = '/initialpage';
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 400,
            width: 400,
            child:
                //RiveAnimation.asset('assets/flutter.riv')

                Image.asset(
              'assets/welcome.gif',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            width: 300,
            child: Text(
              'I will help you complete your profile.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'RobotoMono', fontSize: 15, color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          InitialCustomButton(
            color: const Color(0xff767BFF),
            text: 'Get Started',
            onTap: () {
              Navigator.pushNamed(
                context,
                '/register',
              );
            },
          )
        ],
      )),
    );
  }
}
