// ignore_for_file: deprecated_member_use, camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';

//Row Widget For Admin Information
class AdminRowWidget extends StatelessWidget {
  final String text1;
  final String text2;
  const AdminRowWidget({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 60,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Row(children: [
            Container(
                height: 50,
                width: 140,
                decoration: BoxDecoration(
                    color: Colors.teal[400],
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(text1,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))))),
            const SizedBox(width: 5),
            Expanded(
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.teal[400],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(text2,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic))))))
          ])),
      const SizedBox(height: 5),
    ]);
  }
}

// text widget for profile...
class profileWidget extends StatelessWidget {
  final percent, name;
  const profileWidget({Key? key, required this.percent, required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: ('$percent\n'),
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(151, 0, 77, 64)),
            children: [
              TextSpan(
                  text: name,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(151, 0, 77, 64)))
            ]));
  }
}
