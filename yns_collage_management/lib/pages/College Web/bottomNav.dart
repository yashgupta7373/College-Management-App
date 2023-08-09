// ignore_for_file: file_names
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:yns_college_management/pages/College%20Web/clgweb_page.dart';
import 'package:yns_college_management/pages/College%20Web/getintouch_page.dart';
import '../login_page.dart';
import 'notification.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  // ignore: non_constant_identifier_names
  final Screens = [
    const ClgWebPage(),
    const GetInTouchPage(),
    const NotificationPage(),
    const LoginPage()
  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.home, size: 30),
      const Icon(Icons.message, size: 30),
      const Icon(Icons.notifications, size: 30),
      const Icon(Icons.person, size: 30)
    ];
    return Container(
        color: Colors.teal.shade800,
        child: SafeArea(
            top: false,
            child: ClipRRect(
                child: Scaffold(
                    extendBody: true,
                    backgroundColor: Colors.blue,
                    body: Screens[index],
                    bottomNavigationBar: Theme(
                        data: Theme.of(context).copyWith(
                            iconTheme:
                                const IconThemeData(color: Colors.white)),
                        child: CurvedNavigationBar(
                            key: navigationKey,
                            backgroundColor: Colors.transparent,
                            buttonBackgroundColor: Colors.teal.shade500,
                            color: Colors.teal.shade800,
                            items: items,
                            height: 60,
                            index: index,
                            onTap: (index) =>
                                setState(() => this.index = index)))))));
  }
}
