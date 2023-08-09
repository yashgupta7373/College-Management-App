// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../College Web/bottomNav.dart';
import '../navigation_bar.dart';

class SplashPage extends StatefulWidget {
  var image;
  SplashPage({required this.image, super.key});
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 5500), () {
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser;
      if (user != null) {
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.fade, child: const BottomNavBar()));
      } else {
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: const BottomNavigation()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.teal[800],
        body: SizedBox(
            width: double.infinity,
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  SizedBox(height: mediaQuery.size.height * 0.2),
                  SizedBox(
                      height: mediaQuery.size.height * 0.3,
                      child: widget.image),
                  SizedBox(
                      height: mediaQuery.size.height * 0.2,
                      width: mediaQuery.size.width * 0.9,
                      child: FittedBox(
                          child: Text("College Management\n System",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.dancingScript(
                                  shadows: [
                                    Shadow(
                                        color: Colors.teal.shade700,
                                        blurRadius: 5,
                                        offset: const Offset(2, 2))
                                  ],
                                  fontWeight: FontWeight.w900,
                                  color: const Color.fromARGB(
                                      255, 43, 232, 213))))),
                  SizedBox(height: mediaQuery.size.height * 0.22),
                  SizedBox(
                      height: mediaQuery.size.height * 0.02,
                      child: Text("from",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.teal[300],
                              fontSize: 15))),
                  SizedBox(
                      height: mediaQuery.size.height * 0.04,
                      child: Text("YNS Group",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.passeroOne(
                              textStyle: const TextStyle(fontSize: 20),
                              shadows: [
                                Shadow(
                                    color: Colors.teal.shade700,
                                    blurRadius: 5,
                                    offset: const Offset(2, 2))
                              ],
                              fontWeight: FontWeight.w900,
                              color: const Color.fromARGB(255, 2, 54, 46)))),
                  SizedBox(height: mediaQuery.size.height * 0.02)
                ]))));
  }
}
