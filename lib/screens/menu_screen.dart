import 'package:flutter/material.dart';
import 'package:keycloakflutter/services/auth_service.dart';

import 'package:keycloakflutter/screens/home/widgets_home/analytic_card.dart';
import 'package:keycloakflutter/screens/home/widgets_home/footer_home.dart';
import 'package:keycloakflutter/screens/home/widgets_home/total_balance_card.dart';
// import '../../shared/preferences.dart';
import '../../widgets/custom_drawer.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(
          child: CustomDrawer(),
        ),
        appBar: AppBar(
          actions: [
            TextButton.icon(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/crear-empresas',
                );
              },
              label: const Text(
                'Create Company',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
          title: Text(AuthService.instance.profile!.name),
          // "Hi Guest!"),
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
              ],
            ),
          ),
        ));

    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Text(AuthService.instance.profile!.name),
    //         Text(
    //           'You\'re logged in',
    //         ),
    //         OutlinedButton(
    //             onPressed: () {
    //               AuthService.instance.logout();
    //             },
    //             child: Text("Logout"))
    //       ],
    //     ),
    //   ),
    // );
  }

  /*
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
    */
}
