import 'package:flutter/cupertino.dart';
import 'package:keycloakflutter/screens/hakim/screens/speech_screen.dart';
import 'package:keycloakflutter/screens/home/services/quickbooks/quickbooks.dart';
import 'package:keycloakflutter/screens/profile/profile_screen.dart';
import 'package:keycloakflutter/social%20media/social_screen.dart';
import 'package:keycloakflutter/theme/app_theme.dart';
import 'package:keycloakflutter/widgets/ia.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/cashflow/cash_flow_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/hakim/ia_screen.dart';
import 'global_variables.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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
    const HomeScreen(),
    const QuickbooksScreen()
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
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [
        const HomeScreen(),
        const CashFlowScreen(),
        const SpeechScreen(),
        const SocialScreen(),
        const ProfileScreen()
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.home),
          title: ("Home"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,

          // routeAndNavigatorSettings: RouteAndNavigatorSettings(
          //   initialRoute: "/actual-home",
          //   routes: {
          //     "/first": (final context) => const QuickbooksScreen(),
          //     // "/second": (final context) => const MainScreen3(),
          //   },
          // ),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.chart_bar_alt_fill),
          title: ("CashFlow"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          // icon: CircleAvatar(
          //     radius: 55, backgroundImage: AssetImage('assets/image.png')),
          icon: Image.asset('assets/image.png'),
          iconSize: 155,
          title: ("Hakim"),
          activeColorPrimary: CupertinoColors.systemGrey,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.profile_circled),
          title: ("Profile"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.settings),
          title: ("Settings"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }

  //   return Scaffold(
  //     body: pages[_page],
  //     bottomNavigationBar: BottomNavigationBar(
  //       currentIndex: _page,
  //       selectedItemColor: GlobalVariables.selectedNavBarColor,
  //       unselectedItemColor: AppTheme.primary,
  //       backgroundColor: GlobalVariables.backgroundColor,
  //       iconSize: 25,
  //       onTap: updatePage,
  //       items: [
  //         BottomNavigationBarItem(
  //           icon: Container(
  //             width: bottomNavBarWidth,
  //             decoration: BoxDecoration(
  //               border: Border(
  //                 top: BorderSide(
  //                   color: _page == 0
  //                       ? GlobalVariables.selectedNavBarColor
  //                       : Color.fromARGB(255, 231, 235, 239),
  //                   width: bottomNavBarBorderWidth,
  //                 ),
  //               ),
  //             ),
  //             child: const Icon(Icons.home),
  //           ),
  //           label: '',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Container(
  //             width: bottomNavBarWidth,
  //             decoration: BoxDecoration(
  //               border: Border(
  //                 top: BorderSide(
  //                   color: _page == 1
  //                       ? GlobalVariables.selectedNavBarColor
  //                       : GlobalVariables.backgroundColor,
  //                   width: bottomNavBarBorderWidth,
  //                 ),
  //               ),
  //             ),
  //             child: const Icon(Icons.analytics),
  //           ),
  //           label: '',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Container(
  //             width: bottomNavBarWidth,
  //             decoration: BoxDecoration(
  //               border: Border(
  //                 top: BorderSide(
  //                   color: _page == 2
  //                       ? GlobalVariables.selectedNavBarColor
  //                       : GlobalVariables.backgroundColor,
  //                   width: bottomNavBarBorderWidth,
  //                 ),
  //               ),
  //             ),
  //             child: const IaIcon(),
  //           ),
  //           label: '',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Container(
  //               width: bottomNavBarWidth,
  //               decoration: BoxDecoration(
  //                 border: Border(
  //                   top: BorderSide(
  //                     color: _page == 3
  //                         ? GlobalVariables.selectedNavBarColor
  //                         : GlobalVariables.backgroundColor,
  //                     width: bottomNavBarBorderWidth,
  //                   ),
  //                 ),
  //               ),
  //               child: const Icon(FontAwesomeIcons.user)),
  //           label: '',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Container(
  //               width: bottomNavBarWidth,
  //               decoration: BoxDecoration(
  //                 border: Border(
  //                   top: BorderSide(
  //                     color: _page == 4
  //                         ? GlobalVariables.selectedNavBarColor
  //                         : GlobalVariables.backgroundColor,
  //                     width: bottomNavBarBorderWidth,
  //                   ),
  //                 ),
  //               ),
  //               child: const Icon(Icons.settings)),
  //           label: '',
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
