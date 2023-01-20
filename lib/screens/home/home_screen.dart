import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:keycloakflutter/screens/hakim/screens/speech_screen.dart';
import 'package:keycloakflutter/screens/home/widgets_home/analytic_card.dart';
import 'package:keycloakflutter/screens/home/widgets_home/footer_home.dart';
import 'package:keycloakflutter/screens/home/widgets_home/total_balance_card.dart';
import 'package:flutter/material.dart';
import 'package:keycloakflutter/screens/login(keycloak)/service/auth_service.dart';

import '../../shared/preferences.dart';
import '../../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/home';

  Widget hakim(BuildContext context) {
    return Container(
        width: 250,
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Color(0xff3b5998),
              child: const Icon(FontAwesomeIcons.person),
              onPressed: () {
                Navigator.pushNamed(context, SpeechScreen.routeName);
              },
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      appBar: AppBar(actions: [
        TextButton.icon(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigator.pushNamed(
            //   context,
            //   '/crear-empresas',
            // );
            context.go('/crear-empresas');
          },
          label: const Text(
            'Create Company',
            style: TextStyle(color: Colors.white),
          ),
        )
      ], title: Text('Hi User')

          //actions: const [IaIcon()],
          ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              SizedBox(
                height: 5,
              ),
              TotalBalance(),
              SizedBox(
                height: 10,
              ),
              AnalyticCard(),
              FooterHome(),
              // Container(
              //     width: 250,
              //     height: 50,
              //     alignment: Alignment.bottomRight,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(10)),
              //     ),
              //     child: SizedBox(
              //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       child: FloatingActionButton(
              //         backgroundColor: Color.fromARGB(255, 155, 155, 155),
              //         child: const Icon(FontAwesomeIcons.circle),
              //         onPressed: () {
              //           Navigator.pushNamed(context, SpeechScreen.routeName);
              //         },
              //       ),
              //     ))
            ],
          ),
        ),
      ),
    );
  }
}
