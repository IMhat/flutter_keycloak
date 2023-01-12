import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:keycloakflutter/screens/questions/question1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/bottom_bar.dart';

class Check extends StatefulWidget {
  const Check({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  int? isviewed;
  void check() async {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    // ));
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isviewed = prefs.getInt('onBoard');
  }

  @override
  Widget build(BuildContext context) {
    //   return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: isviewed != 0 ? OnBoard() : const BottomBar(),
    //   );
    // }
    return Scaffold(
        body: Container(
      child: isviewed != 0 ? Question1Screen() : const BottomBar(),
    ));
    // return Scaffold(
    //   body: isviewed != 0 ? OnBoard() : const BottomBar(),
    // );
  }
}
