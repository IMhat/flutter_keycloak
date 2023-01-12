import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keycloakflutter/screens/questions/widgets/answer_button.dart';

import 'widgets/button_gradient.dart';

class Question2Screen extends StatelessWidget {
  static const String routeName = '/question2';
  const Question2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 330,
                width: 350,
                child: Image.asset(
                  'assets/avatarquestion2.gif',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              AnswerButton(
                text: 'I own a business',
                onPressed: (() {
                  Navigator.pushNamed(
                    context,
                    '/question3',
                  );
                }),
              ),
              const SizedBox(
                height: 5,
              ),
              AnswerButton(
                text: 'I am the head of a team',
                onPressed: (() {
                  Navigator.pushNamed(
                    context,
                    '/question3',
                  );
                }),
              ),
              const SizedBox(
                height: 5,
              ),
              AnswerButton(
                text: 'I am a member of a team',
                onPressed: (() {
                  Navigator.pushNamed(
                    context,
                    '/question3',
                  );
                }),
              ),
              const SizedBox(
                height: 5,
              ),
              AnswerButton(
                text: 'Working on my own',
                onPressed: (() {
                  Navigator.pushNamed(
                    context,
                    '/question3',
                  );
                }),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 250,
                height: 45,
                child: Form(
                    child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Other',
                      hintStyle: TextStyle(color: Colors.black)),
                  style: const TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                )),
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
                        (Color(0xff7BC05B)),
                        Color.fromARGB(255, 151, 205, 126),
                        Color.fromARGB(255, 208, 227, 199)
                      ]),
                  borderRadius: BorderRadius.circular(15),
                ),
                onTap: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   '/question3',
                  // );
                  context.go('/question-3');
                },
                text: 'Next',
              )
            ],
          )),
        ));
  }

  Row indicatorQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 197, 231, 182),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: const Color(0xff7BC05B),
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
            color: const Color.fromARGB(255, 197, 231, 182),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ],
    );
  }
}


// Color(0xffFD0745),
//                     Color(0xff6D49C2),