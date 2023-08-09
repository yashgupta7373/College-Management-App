import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  var subject = TextEditingController();
  var message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(height: 30),
          SizedBox(
              width: 350,
              child: Center(
                  child: Text("Help !",
                      style: TextStyle(
                          shadows: [
                            Shadow(
                                color: Colors.teal.shade900,
                                blurRadius: 5,
                                offset: const Offset(2, 2))
                          ],
                          fontSize: 90,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)))),
          const SizedBox(height: 30),
          Center(
              child: Stack(children: [
            Center(
                child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 1, color: Colors.teal.shade600),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.teal.shade900,
                                  spreadRadius: 1)
                            ])))),
            // Subject
            Positioned(
                top: 35,
                left: mediaQuery.size.width * 0.12,
                right: mediaQuery.size.width * 0.12,
                child: SizedBox(
                    width: mediaQuery.size.width * 0.75,
                    child: TextField(
                        controller: subject,
                        maxLength: 50,
                        maxLines: 1,
                        decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: true,
                            labelText: "Subject",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)))))),
            // Message
            Positioned(
                top: 118,
                left: mediaQuery.size.width * 0.12,
                right: mediaQuery.size.width * 0.12,
                child: SizedBox(
                    width: mediaQuery.size.width * 0.75,
                    child: TextField(
                        controller: message,
                        maxLength: 1000,
                        maxLines: 10,
                        decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: true,
                            labelText: "Message",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)))))),
            // Submit
            Positioned(
                bottom: 20,
                right: mediaQuery.size.width * 0.15,
                child: ElevatedButton(
                    onPressed: () {
                      String sub = subject.text.toString();
                      String msg = message.text.toString();
                      // ignore: deprecated_member_use
                      launch(
                          'mailto: ykg1357@gmail.com?subject=$sub&body=$msg');
                    },
                    style:
                        TextButton.styleFrom(minimumSize: const Size(120, 40)),
                    child: const Text("Submit")))
          ]))
        ])));
  }
}
