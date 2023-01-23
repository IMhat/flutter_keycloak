import 'package:keycloakflutter/screens/hakim/screens/speech_screen.dart';
import 'package:keycloakflutter/social%20media/social_screen.dart';
import 'package:keycloakflutter/theme/app_theme.dart';
import 'package:keycloakflutter/widgets/ia.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/cashflow/cash_flow_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/hakim/ia_screen.dart';
import 'global_variables.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomNavBarWidth = 42;
  double bottomNavBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const CashFlowScreen(),
    // const IaScreen(),
    const SpeechScreen(),
    const SocialScreen(),
    // const ProfileScreen(),
    const HomeScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final userCartLength = Provider.of<UserProvider>(context).user.cart.length;
    // final userCartLength = context.watch<UserProvider>().user.cart.length;

    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: AppTheme.primary,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 25,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomNavBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : Color.fromARGB(255, 231, 235, 239),
                    width: bottomNavBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.home),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomNavBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomNavBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.analytics),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomNavBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomNavBarBorderWidth,
                  ),
                ),
              ),
              child: const IaIcon(),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
                width: bottomNavBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 3
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomNavBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(FontAwesomeIcons.user)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
                width: bottomNavBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 4
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomNavBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(Icons.settings)),
            label: '',
          ),
        ],
      ),
    );
  }
}
