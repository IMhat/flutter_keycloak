import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keycloakflutter/screens/login(keycloak)/constant.dart';
import 'package:keycloakflutter/screens/questions/widgets/answer_button.dart';
import 'package:keycloakflutter/screens/questions/widgets/big_text.dart';
import 'package:keycloakflutter/screens/questions/widgets/big_text_black.dart';
import 'package:keycloakflutter/screens/questions/widgets/lenguague_button.dart';
import 'package:keycloakflutter/screens/questions/widgets/question.dart';
import 'package:keycloakflutter/screens/questions/widgets/question_picker.dart';
import 'package:keycloakflutter/screens/questions/widgets/small_text.dart';

import 'package:keycloakflutter/widgets/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../hakim/controllers/tts.dart';
import 'widgets/button_gradient.dart';

class Question2_3Screen extends StatefulWidget {
  static const String routeName = '/question-2_3';
  const Question2_3Screen({Key? key}) : super(key: key);

  @override
  State<Question2_3Screen> createState() => _Question2_3ScreenState();
}

class _Question2_3ScreenState extends State<Question2_3Screen> {
  final _businessQuestion2FormKey = GlobalKey<FormState>();

  final TextEditingController _nameCompanyController = TextEditingController();
  final TextEditingController _selectorController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
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

  String msg = "Contesta las preguntas sobre tu negocio";

  void talk() {
    Future.delayed(const Duration(milliseconds: 500), () {
      TextToSpeech.speak(msg);
    });
  }

  Widget _businessQuestion1() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      // padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        key: _businessQuestion2FormKey,
        children: <Widget>[
          Text('Name Company',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
              )),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: _selectorController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Enter name',
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black38,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black38,
                ),
              ),
            ),
            // validator: (val) {
            //   if (val == null || val.isEmpty) {
            //     return 'Please enter $hintText';
            //   }
            //   return null;
            // },
            // maxLines: maxLines,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'Selector',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 15,
          ),
          // CustomTextField(

          //   controller: _passwordController,
          //   hintText: 'Enter Password',
          // ),

          TextFormField(
            controller: _selectorController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Select',
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black38,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black38,
                ),
              ),
            ),
            // validator: (val) {
            //   if (val == null || val.isEmpty) {
            //     return 'Please enter $hintText';
            //   }
            //   return null;
            // },
            // maxLines: maxLines,
          ),
          const SizedBox(
            height: 15,
          ),
          Text('Number of employees',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
              )),

          TextFormField(
            controller: _nameCompanyController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Select',
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black38,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black38,
                ),
              ),
            ),
            // validator: (val) {
            //   if (val == null || val.isEmpty) {
            //     return 'Please enter $hintText';
            //   }
            //   return null;
            // },
            // maxLines: maxLines,
          ),
        ],
      ),
    );
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
                    //   9,
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
                  height: 60,
                ),

                Image.asset('assets/logo2.png'),

                IconButton(
                  icon: Image.asset('assets/image.png'),
                  iconSize: 80,
                  onPressed: () {},
                ),

                const SizedBox(
                  height: 20,
                ),
                // SizedBox(
                //     child: Container(
                //   padding: EdgeInsets.symmetric(horizontal: 40),
                //   alignment: Alignment.center,
                //   child: SmallText(
                //     text:
                //         ' en esta pantalla, deberás responder el test de personalidad, esto nos ayuda a conocerte un poco más',
                //     size: 20,
                //     color: Colors.white,
                //   ),
                // )),

                const SizedBox(
                  height: 20,
                  width: 350,
                ),
                SizedBox(
                    child: Align(
                  alignment: Alignment.centerLeft,
                  child: BigTextBlack(
                    text: '  Set up about your bussiness',
                    size: 30,
                    color: Colors.white,
                  ),
                )),
                // ACA HAY QUE CARGAR LAS PREGUNTAS BAJADAS DE LA API REST--------------------------------------
                // const SizedBox(
                //   child: Questions(),
                // ),
                _businessQuestion1(),

                //----------------------------------------------------------------------
                const SizedBox(
                  height: 40,
                  width: 350,
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
                    _storeOnboardInfo();
                    Navigator.pushNamed(
                      context,
                      '/question-2',
                    );
                    //context.go('/question-3');
                  },
                  text: 'Next',
                ),
                const SizedBox(
                  height: 20,
                ),

                // ButtonGradient(
                //   decoration: BoxDecoration(
                //     gradient: const LinearGradient(
                //         begin: AlignmentDirectional.topCenter,
                //         end: Alignment.bottomCenter,
                //         stops: [
                //           0,
                //           1,
                //           0
                //         ],
                //         colors: [
                //           (Color.fromARGB(255, 255, 255, 255)),
                //           Color.fromARGB(0, 255, 255, 255),
                //           Color.fromARGB(255, 255, 255, 255)
                //         ]),
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                //   onTap: () {
                //     _storeOnboardInfo();
                //     Navigator.pushNamed(
                //       context,
                //       '/actual-home',
                //     );
                //     //context.go('/question-3');
                //   },
                //   text: '  Later >|',
                // ),
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
