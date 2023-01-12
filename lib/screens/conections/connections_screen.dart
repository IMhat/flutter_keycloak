import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/custom_drawer.dart';

class ConnectionsScreen extends StatelessWidget {
  static const String routeName = '/conections';
  const ConnectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: const Drawer(
          child: CustomDrawer(),
        ),
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: currentWidth,
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: const Text(
                            'Connections',
                            style: TextStyle(fontSize: 25),
                          )),
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        width: currentWidth,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: currentWidth,
                              height: 150,
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.pushNamed(
                                  //   context,
                                  //   '/actual-home',
                                  // );
                                  context.go('/actual-home');
                                },
                                child: Image.asset(
                                  'assets/service1.png',
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (() {
                                // Navigator.pushNamed(
                                //   context,
                                //   '/actual-home',
                                // );
                                context.go('/actual-home');
                              }),
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/service2.png'),
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              height: 100,
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.pushNamed(
                                  //   context,
                                  //   '/actual-home',
                                  // );
                                  context.go('/actual-home');
                                },
                                child: Image.asset(
                                  'assets/service3.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
