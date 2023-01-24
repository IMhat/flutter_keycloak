import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keycloakflutter/screens/login(keycloak)/constant.dart';
import 'package:keycloakflutter/screens/questions/widgets/answer_button.dart';
import 'package:keycloakflutter/screens/questions/widgets/big_text.dart';
import 'package:keycloakflutter/screens/questions/widgets/big_text_black.dart';
import 'package:keycloakflutter/screens/questions/widgets/lenguague_button.dart';
import 'package:keycloakflutter/screens/questions/widgets/picker_lenguague.dart';
import 'package:keycloakflutter/screens/questions/widgets/small_text.dart';

import 'package:keycloakflutter/widgets/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/button_gradient.dart';

class LenguajeScreen extends StatelessWidget {
  static const String routeName = '/lenguaje';
  LenguajeScreen({Key? key}) : super(key: key);

  void _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  final List<PickerItem> paymentModes = [
    PickerItem("English", 'assets/English.jpg'),
    PickerItem("Spanish", 'assets/Spanish.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            // const SizedBox(
            //   height: 40,
            // ),
            // SizedBox(
            //   height: 330,
            //   width: 350,
            //   child: Image.asset(
            //     'assets/question1.gif',
            //     fit: BoxFit.contain,
            //   ),
            // ),

            const SizedBox(
              height: 175,
              width: 350,
              //child: Text('Welcome to'),
            ),
            SizedBox(
                child: Align(
              alignment: Alignment.centerLeft,
              child: BigTextBlack(
                text: '  Welcome to',
                size: 45,
                color: Colors.black,
              ),
            )),
            const SizedBox(
              height: 35,
              width: 350,
            ),

            Image.asset('assets/logo.png'),
                  
            const SizedBox(
              height: 100,
              width: 350,
            ),
            SizedBox(
                child: Align(
              alignment: Alignment.centerLeft,
              child: SmallText(
                text: '    Set up your lenguague',
              ),
            )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: PickerWidget(pickerItems: paymentModes),
            ),

            // LenguagueButton(
            //   imagen: Image.asset(
            //     'assets/English.jpg',
            //     fit: BoxFit.cover,
            //     width: 75,
            //   ),
            //   text: 'English',
            //   onPressed: (() {
            //     // Navigator.pushNamed(
            //     //   context,
            //     //   'question-2',
            //     // );
            //   }),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // LenguagueButton(
            //   imagen: Image.asset(
            //     'assets/Spanish.png',
            //     fit: BoxFit.cover,
            //     width: 76,
            //   ),
            //   text: 'Spanish',
            //   onPressed: (() {
            //     // Navigator.pushNamed(
            //     //   context,
            //     //   '/question1',
            //     // );
            //   }),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // LenguagueButton(
            //   imagen: Image.asset(
            //     'assets/French.png',
            //     fit: BoxFit.cover,
            //     width: 75,
            //   ),
            //   text: 'French',
            //   onPressed: (() {
            //     // Navigator.pushNamed(
            //     //   context,
            //     //   '/question1',
            //     // );
            //   }),
            // ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 20,
            ),
            indicatorQuestion(),
            const SizedBox(
              height: 40,
            ),
            ButtonGradient(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.2,
                      0.5,
                      10
                    ],
                    colors: [
                      (Color.fromARGB(255, 0, 0, 0)),
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(255, 0, 0, 0)
                    ]),
                borderRadius: BorderRadius.circular(15),
              ),
              onTap: () {
                // _storeOnboardInfo();
                Navigator.pushNamed(
                  context,
                  '/iaScreen',
                );
                // context.go('/OnboardingIa');
              },
              text: 'Continuos',
            ),
            // TextButton(
            //   onPressed: () {
            //     //_storeOnboardInfo();
            //     Navigator.pushReplacement(context,
            //         MaterialPageRoute(builder: (context) => BottomBar()));
            //   },
            //   child: Text(
            //     "Skip",
            //     style: TextStyle(
            //       color: kwhite,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Row indicatorQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 204, 204, 204),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 204, 204, 204),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ],
    );
  }
}


// Color(0xffFD0745),
//                     Color(0xff6D49C2),