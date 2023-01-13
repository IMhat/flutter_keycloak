import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keycloakflutter/screens/questions/lenguaje.dart';

import 'package:keycloakflutter/screens/questions/question1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/bottom_bar.dart';

int? isviewed;
void check() async {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  // ));

  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
}

class Check extends StatefulWidget {
  const Check({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  @override
  void initState() {
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    //   return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: isviewed != 0 ? OnBoard() : const BottomBar(),
    //   );
    // }

    //crear una screen para las otras pantallas( ejemplo selector de idioma)

    return Scaffold(
        body: Container(
      child: isviewed != 1 ? LenguajeScreen() : const BottomBar(),
    ));
    // return Scaffold(
    //   body: isviewed != 0 ? OnBoard() : const BottomBar(),
    // );
  }
}
