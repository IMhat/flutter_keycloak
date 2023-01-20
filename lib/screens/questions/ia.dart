import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keycloakflutter/screens/hakim/controllers/tts.dart';
import 'package:keycloakflutter/screens/login(keycloak)/constant.dart';
import 'package:keycloakflutter/screens/questions/widgets/answer_button.dart';
import 'package:keycloakflutter/screens/questions/widgets/big_text.dart';
import 'package:keycloakflutter/screens/questions/widgets/big_text_black.dart';
import 'package:keycloakflutter/screens/questions/widgets/lenguague_button.dart';
import 'package:keycloakflutter/screens/questions/widgets/small_text.dart';

import 'package:keycloakflutter/widgets/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/button_gradient.dart';

class OnboardingIaScreen extends StatefulWidget {
  static const String routeName = '/iaScreen';
  const OnboardingIaScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingIaScreen> createState() => _OnboardingIaScreenState();
}

class _OnboardingIaScreenState extends State<OnboardingIaScreen> {
// class OnboardingIaScreen extends StatelessWidget {
  // static const String routeName = '/iaScreen';
  // const OnboardingIaScreen({Key? key}) : super(key: key);

  void _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  void initState() {
    super.initState();
    talk();
  }

  String msg = "Hola, soy hakim";

  void talk() {
    Future.delayed(const Duration(milliseconds: 500), () {
      TextToSpeech.speak(msg);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    //     stops: [
                    //   0.2,
                    //   0.4,
                    // ],
                    colors: [
                  Color.fromARGB(255, 143, 200, 241),
                  // Color.fromARGB(255, 94, 129, 253),
                  Color.fromARGB(255, 70, 106, 234)
                ])),
            // alignment: Alignment.centerLeft,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                    child: Align(
                  alignment: Alignment.topCenter,
                  child: BigText(
                    text: '  TheCocreator',
                    color: Colors.white,
                    size: 30,
                  ),
                )),
                // ACA HAY QUE AÑADIR LA PELOTA BLANCA QUE HABLA Y TIENE EFECTOS--------------------------

                //---------------------------------------------------------------

                const SizedBox(
                  height: 400,
                  width: 350,
                ),
                SizedBox(
                    child: Align(
                  alignment: Alignment.centerLeft,
                  child: SmallText(
                    text: '  Hello user! my name is ...',
                    size: 20,
                    color: Colors.white,
                  ),
                )),
                const SizedBox(
                  height: 150,
                  width: 350,
                ),
                const SizedBox(
                  height: 20,
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
                    //context.go('/OnboardingIa');
                  },
                  text: 'Repeat',
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonGradient(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0,
                          1,
                          0
                        ],
                        colors: [
                          (Color.fromARGB(255, 255, 255, 255)),
                          Color.fromARGB(0, 255, 255, 255),
                          Color.fromARGB(255, 255, 255, 255)
                        ]),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onTap: () {
                    //_storeOnboardInfo();
                    Navigator.pushNamed(
                      context,
                      '/question-1',
                    );
                    //context.go('/question-1');
                  },
                  text: '  Skip >|',
                ),
                // TextButton(
                //   onPressed: () {
                //     _storeOnboardInfo();
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
                const SizedBox(
                  height: 200,
                ),
              ],
            )),
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