// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/pages/College%20Web/aboutclg_page.dart';
import 'package:yns_college_management/pages/College%20Web/courses_page.dart';
import 'package:yns_college_management/pages/College%20Web/developer_page.dart';
import 'package:yns_college_management/pages/College%20Web/fee_page.dart';
import 'package:yns_college_management/pages/College%20Web/getintouch_page.dart';
import 'package:yns_college_management/pages/College%20Web/help_page.dart';
import 'package:yns_college_management/pages/College%20Web/photogallery_Page.dart';

// Profile
class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.teal[800],
        width: double.infinity,
        height: 200,
        padding: const EdgeInsets.only(top: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 70,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/img5.png")))),
          const Text("I.P. College, Campus-2",
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Text("BulandShahr, Delhi Road, 203001(UP)",
              style: TextStyle(color: Colors.grey[200], fontSize: 14))
        ]));
  }
}

// Contact
class MyDrawerlist extends StatefulWidget {
  const MyDrawerlist({super.key});
  @override
  _MyDrawerlistState createState() => _MyDrawerlistState();
}

class _MyDrawerlistState extends State<MyDrawerlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 730,
        color: Colors.teal[200],
        padding: const EdgeInsets.only(top: 15),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(15),
              child: Column(children: [
                // About College
                ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: const AboutClgPage()));
                    },
                    leading: const Icon(Icons.account_balance,
                        size: 20, color: Colors.black),
                    title: const Text('About College',
                        style: TextStyle(color: Colors.black, fontSize: 16))),
                // Department and Courses
                ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: const CoursesPage()));
                    },
                    leading: const Icon(Icons.menu_book,
                        size: 20, color: Colors.black),
                    title: const Text('Department And Courses',
                        style: TextStyle(color: Colors.black, fontSize: 16))),
                // Wall Magazine
                ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: const WallMagazine()));
                    },
                    leading:
                        const Icon(Icons.photo, size: 20, color: Colors.black),
                    title: const Text('Wall Magazine',
                        style: TextStyle(color: Colors.black, fontSize: 16))),
                // Fee Structure
                ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: const feePage()));
                    },
                    leading: const Icon(Icons.attach_money,
                        size: 20, color: Colors.black),
                    title: const Text('Fee Structure',
                        style: TextStyle(color: Colors.black, fontSize: 16))),
                // Get In Touch
                ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: const GetInTouchPage()));
                    },
                    leading: const Icon(Icons.contacts,
                        size: 20, color: Colors.black),
                    title: const Text('Get In Touch',
                        style: TextStyle(color: Colors.black, fontSize: 16))),
                const SizedBox(height: 100),
                // Help
                ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: const HelpPage()));
                    },
                    leading:
                        Icon(Icons.help, size: 20, color: Colors.teal[900]),
                    title: Text('Help',
                        style:
                            TextStyle(color: Colors.teal[900], fontSize: 16))),
                // Developer
                ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: const DeveloperPage()));
                    },
                    leading: Icon(Icons.developer_mode,
                        size: 20, color: Colors.teal[900]),
                    title: Text('Developer',
                        style:
                            TextStyle(color: Colors.teal[900], fontSize: 16)))
              ]))
        ]));
  }
}
