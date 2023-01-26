// import 'package:keycloakflutter/shared/preferences.dart';
import 'package:keycloakflutter/login(JWT)/services/auth_service.dart';
import 'package:keycloakflutter/theme/app_theme.dart';
import 'package:keycloakflutter/widgets/switch_dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

// import 'package:provider/provider.dart';

// import '../screens/login/service/auth_service2.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    // final authService = Provider.of<AuthService>(context, listen: false);
    final AuthService authService = AuthService();

    final user = context.watch<UserProvider>().user;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: double.infinity,
            height: 80,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Container(
              margin: const EdgeInsets.only(right: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    // 'Hi Guest',
                    user.name,
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 78, 152, 237)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Track your Shopping activities',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            indent: 2,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
          ListTile(
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            leading: const Icon(
              Icons.settings,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   'actual-home',
              // );
            },
          ),
          ListTile(
            title: const Text(
              'Support',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            leading: const Icon(
              Icons.help,
              color: Colors.black,
            ),
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   '',
              // );
            },
          ),
          ListTile(
            title: const Text(
              'English',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            leading: const Icon(
              Icons.language,
              color: Colors.black,
            ),
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   '',
              // );
            },
          ),
          Container(
            height: 50,
            width: 50,
            child: IconButton(
              icon: Image.asset('assets/coursera.png'),
              iconSize: 10,
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          TextButton.icon(
              onPressed: (() {
                //AuthService.instance.logout();(CIERRE DE SESION CON KEYCLOAK!)
                // Navigator.pushReplacementNamed(context, '/login');
                authService.logOut(context);
              }),
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              label: const Text(
                'Cierre de sesion',
                style: TextStyle(color: Colors.white),
              )),
          Column(
            children: const [SwitchDarkMode()],
          )
        ],
      ),
    );
  }
}
//     return ListView.separated(
//       physics: const BouncingScrollPhysics(),
//       separatorBuilder: (context, i) => Divider(
//         color: appTheme.primaryColorLight,
//       ),
//       itemCount: pageRoutes.length,
//       itemBuilder: (context, i) => ListTile(
//         leading: FaIcon(pageRoutes[i].icon, color: appTheme.accentColor),
//         title: Text(pageRoutes[i].titulo),
//         trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
//         onTap: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => pageRoutes[i].page));
//         },
//       ),
//     );
//   }
// }
