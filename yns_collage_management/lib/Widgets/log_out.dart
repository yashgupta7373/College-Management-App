// ignore_for_file: deprecated_member_use
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/pages/College%20Web/bottomNav.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  backgroundColor: const Color.fromRGBO(100, 232, 222, 0.7),
                  title: const Text('Are You Sure You Want you LogOut',
                      style: TextStyle(fontSize: 18)),
                  content:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text('CANCEL',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 77, 64)))),
                    TextButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut().then((value) {
                            Navigator.of(ctx).pop();
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: const BottomNavigation()));
                          });
                        },
                        child: const Text('LOG OUT',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 77, 64))))
                  ])));
        },
        child: const Icon(
          FontAwesomeIcons.signOut,
          color: Colors.white,
          // color: Colors.black,
        ));
  }
}
