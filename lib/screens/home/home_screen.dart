import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:keycloakflutter/screens/hakim/screens/speech_screen.dart';
import 'package:keycloakflutter/screens/home/services/quickbooks/quickbooks.dart';
import 'package:keycloakflutter/screens/home/widgets_home/analytic_card.dart';
import 'package:keycloakflutter/screens/home/widgets_home/footer_home.dart';
import 'package:keycloakflutter/screens/home/widgets_home/total_balance_card.dart';
import 'package:flutter/material.dart';
import 'package:keycloakflutter/screens/login(keycloak)/service/auth_service.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';
import '../../shared/preferences.dart';
import '../../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 16;

  Widget _AccountsConnect() {
    return Container(
        width: 350,
        height: 350,
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerLeft,
              child: Text('My balance',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 27, 27, 27))),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                  'connect your accounts to see the evolution of your business',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 27, 27, 27))),
            ),
            ElevatedButton(
              child: const Text("Quickbooks-conect"),
              onPressed: () => PersistentNavBarNavigator.pushNewScreen(context,
                  screen: QuickbooksScreen()),
            ),
            // SizedBox(
            //   width: 10,
            // ),
            ElevatedButton(
              child: const Text("Freshbooks-conect"),
              onPressed: () => PersistentNavBarNavigator.pushNewScreen(context,
                  screen: QuickbooksScreen()),
            ),
            // SizedBox(
            //   width: 10,
            // ),
            ElevatedButton(
              child: const Text("Xero-conect"),
              onPressed: () => PersistentNavBarNavigator.pushNewScreen(context,
                  screen: QuickbooksScreen()),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;

    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.black,
        child: CustomDrawer(),
      ),

      // appBar: AppBar(actions: [
      //   TextButton.icon(
      //     icon: const Icon(
      //       Icons.add,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {
      //       // Navigator.pushNamed(
      //       //   context,
      //       //   '/crear-empresas',
      //       // );
      //       context.go('/crear-empresas');
      //     },
      //     label: const Text(
      //       'Create Company',
      //       style: TextStyle(color: Colors.white),
      //     ),
      //   )
      // ], title: Text('Hi User')

      //     //actions: const [IaIcon()],
      //     ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: (Image.asset('assets/logo3.png')),
        // title: Row(
        //   children: [
        //     SizedBox(
        //       width: 80,
        //     ),
        //     SizedBox(
        //       child: Container(
        //         child: Text(
        //           "Cocreator",
        //           style: TextStyle(
        //               fontSize: 30,
        //               fontWeight: FontWeight.w600,
        //               color: Colors.black),
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       width: 100,
        //     ),
        //     SizedBox(
        //       child: Container(
        //         alignment: Alignment.centerLeft,
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Icon(
        //             Icons.notifications,
        //             color: Colors.black,
        //             size: 30,
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                // padding: EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(top: 1, bottom: 0, right: 5),
                child: IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 35,
                    ),
                    onPressed: () {
                      setState(() {
                        counter = 1;
                      });
                    }),
              ),
              counter != 0
                  ? Positioned(
                      right: 11,
                      top: 11,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '$counter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ],
      ),
      //           floatingActionButton: FloatingActionButton(onPressed: () {
      //       print("Increment Counter");
      //       setState(() {
      //         counter++;
      //       });
      //     }, child: Icon(Icons.add),),
      //   );
      // }

      // alignm,
      body: Container(
        // child: Center(
        //     child: Expanded(
        //   child: const QuickbooksScreen(),
        // )
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            //TotalBalance(),
            // SizedBox(
            //   child: ElevatedButton(
            //     child: const Text("Quickbooks-conect"),
            //     onPressed: () => PersistentNavBarNavigator.pushNewScreen(
            //         context,
            //         screen: QuickbooksScreen()),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    // 'Hi Guest',
                    'Hello ',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    // 'Hi Guest',
                    '${user.name} !',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.waving_hand,
                    color: Colors.amber,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _AccountsConnect()

            // AnalyticCard(),
            // FooterHome(),
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
    );
  }
}
