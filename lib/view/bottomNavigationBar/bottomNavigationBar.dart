import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:quicknomsdriver/controller/services/pushNotificationServices/pushNotificationServices.dart';
import 'package:quicknomsdriver/view/accountScreen/accountScreen.dart';
import 'package:quicknomsdriver/view/historyScreen/historyScreen.dart';
import 'package:quicknomsdriver/view/homeScreen/homeScreen.dart';

class BottomNavigationBarQuickNoms extends StatefulWidget {
  const BottomNavigationBarQuickNoms({super.key});

  @override
  State<BottomNavigationBarQuickNoms> createState() =>
      _BottomNavigationBarQuickNomsState();
}

class _BottomNavigationBarQuickNomsState
    extends State<BottomNavigationBarQuickNoms> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {});
    PushNotificationServices.initializeFCM(context);
  }

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: [
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: const HistoryScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.list),
            title: "History",
          ),
        ),
        PersistentTabConfig(
          screen: const AccountScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.person),
            title: "Account",
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}
