import 'package:keycloakflutter/screens/login(keycloak)/service/auth_service.dart';
import 'package:keycloakflutter/screens/login(keycloak)/widget/button_initial.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:rive/rive.dart';

class InitialScreen extends StatefulWidget {
  static const String routeName = '/initialScreen';
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: const <Widget>[
    //         LoginButton(),
    //         Text(
    //           'You have pushed the button this many times:',
    //         ),
    //       ],
    //     ),
    //   ),
    // );
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
              'I will help you.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'RobotoMono', fontSize: 15, color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          // InitialCustomButton(
          //   color: const Color(0xff767BFF),
          //   text: 'Get Started',
          //   onTap: () {
          //     LoginButton();
          //   },
          // )
          InitialCustomButton(
              color: const Color(0xff767BFF),
              text: "Login or Signup",
              onTap: () async {
                final result = await AuthService.instance.login();

                if (result != 'SUCCESS') {
                  final snackBar = SnackBar(
                    content: Text(result),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              })
        ],
      )),
    );
  }

  @override
  void initState() {
    // AuthService.instance.init();
    super.initState();
  }
}

// class LoginButton extends StatelessWidget {
//   const LoginButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton(
//       onPressed: () async {
//         final result = await AuthService.instance.login();

//         if (result != 'SUCCESS') {
//           final snackBar = SnackBar(
//             content: Text(result),
//           );

//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         }
//       },
//       child: const Text("Login or Signup"),
//     );
//   }
// }
