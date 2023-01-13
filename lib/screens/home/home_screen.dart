import 'package:go_router/go_router.dart';
import 'package:keycloakflutter/screens/home/widgets_home/analytic_card.dart';
import 'package:keycloakflutter/screens/home/widgets_home/footer_home.dart';
import 'package:keycloakflutter/screens/home/widgets_home/total_balance_card.dart';
import 'package:flutter/material.dart';
import 'package:keycloakflutter/screens/login/service/auth_service.dart';

import '../../shared/preferences.dart';
import '../../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/home';
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
        ], title: Text(AuthService.instance.profile!.name)

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
  }
}
