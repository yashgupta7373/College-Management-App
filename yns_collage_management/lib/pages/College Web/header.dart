import 'package:flutter/material.dart';

class Headerpng extends StatelessWidget {
  const Headerpng({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                          height: 200,
                          width: 360,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/img31.jpg'),
                                  fit: BoxFit.fill),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              border: Border.all(
                                  width: 1, color: Colors.teal.shade600),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.teal.shade900,
                                    spreadRadius: 1)
                              ]))),
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                          height: 200,
                          width: 360,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/img2.png'),
                                  fit: BoxFit.fill),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              border: Border.all(
                                  width: 1, color: Colors.teal.shade600),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.teal.shade900,
                                    spreadRadius: 1)
                              ]))),
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                          height: 200,
                          width: 360,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/img32.jpg'),
                                  fit: BoxFit.fill),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              border: Border.all(
                                  width: 1, color: Colors.teal.shade600),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.teal.shade900,
                                    spreadRadius: 1)
                              ]))),
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                          height: 200,
                          width: 360,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/img33.jpg'),
                                  fit: BoxFit.fill),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              border: Border.all(
                                  width: 1, color: Colors.teal.shade600),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.teal.shade900,
                                    spreadRadius: 1)
                              ]))),
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                          height: 200,
                          width: 360,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/img34.jpg'),
                                  fit: BoxFit.fill),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              border: Border.all(
                                  width: 1, color: Colors.teal.shade600),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.teal.shade900,
                                    spreadRadius: 1)
                              ])))
                ])));
  }
}
