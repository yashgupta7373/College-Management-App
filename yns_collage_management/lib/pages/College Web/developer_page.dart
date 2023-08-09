// ignore_for_file: deprecated_member_use, must_be_immutable, prefer_typing_uninitialized_variables, camel_case_types, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
          Center(
              child: Text("Developers",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Colors.teal.shade900,
                            blurRadius: 5,
                            offset: const Offset(2, 2))
                      ],
                      fontSize: 65,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
          const SizedBox(height: 20),
          // Yash Gupta
          DeveloperCard(
              photo: InkWell(
                  onTap: () {
                    launch('https://instagram.com/yashgupta7373');
                  },
                  child: container(
                    photo: const AssetImage('assets/images/img50.jpg'),
                  )),
              name: 'Yash Gupta',
              description:
                  'He is one of the developer of this application. He is passionate about programming, application/ web developing and designing',
              instagram: InkWell(
                  onTap: () => launch('https://instagram.com/yashgupta7373'),
                  child: const FaIcon(FontAwesomeIcons.instagram,
                      color: Colors.red)),
              fb: InkWell(
                  onTap: () => launch('https://facebook.com/yashgupta7373'),
                  child: const FaIcon(FontAwesomeIcons.facebook,
                      color: Colors.red)),
              twitter: InkWell(
                  onTap: () => launch('https://twitter.com/yashgupta7373'),
                  child: const FaIcon(FontAwesomeIcons.twitter,
                      color: Colors.red)),
              mail: InkWell(
                  onTap: () => launch('mailto:ykg1357@gmail.com'),
                  child: const Icon(Icons.mail, color: Colors.red))),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Divider(
              thickness: 1,
              color: Colors.teal[700],
            ),
          ),
          // Yash Gupta
          DeveloperCard(
              photo: InkWell(
                  onTap: () {
                    launch(
                        'https://instagram.com/yashgupta3646?igshid=NTdlMDg3MTY=');
                  },
                  child: container(
                    photo: const AssetImage('assets/images/img54.jpeg'),
                  )),
              name: 'Yash Gupta',
              description:
                  'He is one of the developer of this application. He is passionate about programming, backend, and web developing.',
              instagram: InkWell(
                  onTap: () => launch(
                      'https://instagram.com/yashgupta3646?igshid=NTdlMDg3MTY='),
                  child: const FaIcon(FontAwesomeIcons.instagram,
                      color: Colors.red)),
              fb: InkWell(
                  onTap: () => launch(
                      'https://www.facebook.com/profile.php?id=100061747445240'),
                  child: const FaIcon(FontAwesomeIcons.facebook,
                      color: Colors.red)),
              twitter: InkWell(
                  onTap: () {},
                  child: const FaIcon(FontAwesomeIcons.twitter,
                      color: Colors.teal)),
              mail: InkWell(
                  onTap: () => launch('mailto:yashg4180@gmail.com'),
                  child: const Icon(Icons.mail, color: Colors.red))),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Divider(
              thickness: 1,
              color: Colors.teal[700],
            ),
          ),
          // Sahil Gupta
          DeveloperCard(
              photo: InkWell(
                  onTap: () => launch(
                      'https://instagram.com/sahil__is__here_?igshid=NTdlMDg3MTY='),
                  child: container(
                    photo: const AssetImage('assets/images/img55.jpg'),
                  )),
              name: 'Sahil Gupta',
              description:
                  'He is one of the developer of this application. He is passionate about programming, web developing and gaming.',
              instagram: InkWell(
                  onTap: () => launch(
                      'https://instagram.com/sahil__is__here_?igshid=NTdlMDg3MTY='),
                  child: const FaIcon(FontAwesomeIcons.instagram,
                      color: Colors.red)),
              fb: InkWell(
                  onTap: () => launch(
                      'https://www.facebook.com/profile.php?id=100016767431352'),
                  child: const FaIcon(FontAwesomeIcons.facebook,
                      color: Colors.red)),
              twitter: InkWell(
                  onTap: () {},
                  child: const FaIcon(FontAwesomeIcons.twitter,
                      color: Colors.teal)),
              mail: InkWell(
                  onTap: () => launch('mailto:sg6946542@gmail.com'),
                  child: const Icon(Icons.mail, color: Colors.red))),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Divider(
              thickness: 1,
              color: Colors.teal[700],
            ),
          ),
          //Navya
          DeveloperCard(
              photo: InkWell(
                  onTap: () {
                    launch(
                        'https://instagram.com/_____navya____goyal__?igshid=NTdlMDg3MTY=');
                  },
                  child: container(
                    photo: const AssetImage('assets/images/img56.jpeg'),
                  )),
              name: 'Navya',
              description:
                  'She is one of the developer of this application. She is passionate about different programming languages and backend',
              instagram: InkWell(
                  onTap: () => launch(
                      'https://instagram.com/_____navya____goyal__?igshid=NTdlMDg3MTY='),
                  child: const FaIcon(FontAwesomeIcons.instagram,
                      color: Colors.red)),
              fb: InkWell(
                  onTap: () {},
                  child: const FaIcon(FontAwesomeIcons.facebook,
                      color: Colors.teal)),
              twitter: InkWell(
                  onTap: () {},
                  child: const FaIcon(FontAwesomeIcons.twitter,
                      color: Colors.teal)),
              mail: InkWell(
                  onTap: () => launch('mailto:goyalnavya2003@gmail.com'),
                  child: const Icon(Icons.mail, color: Colors.red))),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Divider(
              thickness: 1,
              color: Colors.teal[700],
            ),
          ),
          // Sakshi Kumari...
          DeveloperCard(
              photo: InkWell(
                  onTap: () {
                    launch(
                        'https://instagram.com/sakshi.singhal23?igshid=NTdlMDg3MTY=');
                  },
                  child: container(
                    photo: const AssetImage('assets/images/img57.jpg'),
                  )),
              name: 'Sakshi Kumari',
              description:
                  'She is one of the developer of this application. She is passionate about web developing and designing',
              instagram: InkWell(
                  onTap: () => launch(
                      'https://instagram.com/sakshi.singhal23?igshid=NTdlMDg3MTY='),
                  child: const FaIcon(FontAwesomeIcons.instagram,
                      color: Colors.red)),
              fb: InkWell(
                  onTap: () {},
                  child: const FaIcon(FontAwesomeIcons.facebook,
                      color: Colors.teal)),
              twitter: InkWell(
                  onTap: () {},
                  child: const FaIcon(FontAwesomeIcons.twitter,
                      color: Colors.teal)),
              mail: InkWell(
                  onTap: () => launch('mailto:singhal3680@gmail.com'),
                  child: const Icon(Icons.mail, color: Colors.red))),
          const SizedBox(height: 30),
          const Center(
              child: Text("COPYRIGHT ©️ 2023",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
          const SizedBox(height: 10),
        ]))));
  }
}

// card widget...
class DeveloperCard extends StatelessWidget {
  String name, description;
  final photo, instagram, fb, twitter, mail;
  DeveloperCard(
      {required this.photo,
      required this.name,
      required this.description,
      required this.instagram,
      required this.fb,
      required this.twitter,
      this.mail,
      super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
        width: mediaQuery.size.width * 0.73,
        decoration: BoxDecoration(
            color: Colors.teal[800],
            borderRadius: BorderRadius.circular(35),
            border: Border.all(width: 1, color: Colors.teal.shade600),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, color: Colors.teal.shade900, spreadRadius: 1)
            ]),
        child: Column(children: [
          Padding(padding: const EdgeInsets.only(top: 18.0), child: photo),
          Text(name,
              style: TextStyle(
                  shadows: [
                    Shadow(
                        color: Colors.teal.shade900,
                        blurRadius: 5,
                        offset: const Offset(2, 2))
                  ],
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Padding(
            padding:
                const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8, right: 8),
            child: Text(description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[200])),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  bottom: 25, top: 15, left: 30, right: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [instagram, fb, twitter, mail]))
        ]));
  }
}

// Container
class container extends StatelessWidget {
  final AssetImage photo;

  container({required this.photo, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            image: DecorationImage(image: photo, fit: BoxFit.fill),
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: const BorderRadius.all(Radius.circular(75)),
            border: Border.all(width: 1, color: Colors.teal.shade600),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, color: Colors.teal.shade900, spreadRadius: 1)
            ]));
  }
}
