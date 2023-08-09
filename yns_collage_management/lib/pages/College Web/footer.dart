// ignore_for_file: deprecated_member_use, camel_case_types
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class footer extends StatelessWidget {
  const footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        height: 690,
        width: double.infinity,
        child: Column(children: [
          const SizedBox(height: 40),
          Text("About I.P.(P.G.) College Campus-2, Bulandshahr",
              style: TextStyle(
                  color: Colors.teal[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          const SizedBox(height: 20),
          // Telephone
          InkWell(
              onTap: () => launch('tel: +918954892226'),
              child: Icon(Icons.phone, color: Colors.teal[900])),
          Column(children: [
            InkWell(
                onTap: () => launch('tel: +918954892226'),
                child: const Text("Phone: +918954892226",
                    style: TextStyle(color: Colors.black))),
            InkWell(
                onTap: () => launch('tel: +918954892248'),
                child: const Text("                 +918954892248",
                    style: TextStyle(color: Colors.black))),
            InkWell(
                onTap: () => launch('tel: +918954892236'),
                child: const Text("                 +918954892236",
                    style: TextStyle(color: Colors.black)))
          ]),
          const SizedBox(height: 15),
          // Twitter
          InkWell(
              onTap: () => launch('https://twitter.com/bsr_ip'),
              child: FaIcon(FontAwesomeIcons.twitter, color: Colors.teal[900])),
          InkWell(
              onTap: () => launch('https://twitter.com/bsr_ip'),
              child: const Text("twitter: @bsr_ip",
                  style: TextStyle(color: Colors.black))),
          const SizedBox(height: 15),
          // facebook
          InkWell(
              onTap: () => launch('https://www.facebook.com/ipcollegecampus2/'),
              child:
                  FaIcon(FontAwesomeIcons.facebookF, color: Colors.teal[900])),
          InkWell(
              onTap: () => launch('https://www.facebook.com/ipcollegecampus2/'),
              child: const Text("Facebook: I. P. College Campus-2 BSR",
                  style: TextStyle(color: Colors.black))),
          const SizedBox(height: 15),
          // Mail
          InkWell(
              onTap: () => launch('mailto:director@ipcollegebsr.org'),
              child: Icon(Icons.email, color: Colors.teal[900])),
          Column(children: [
            InkWell(
                onTap: () => launch('mailto:director@ipcollegebsr.org'),
                child: const Text("Email: director@ipcollegebsr.org",
                    style: TextStyle(color: Colors.black))),
            InkWell(
                onTap: () => launch('mailto:principal@ipcollegebsr.org'),
                child: const Text("                 principal@ipcollegebsr.org",
                    style: TextStyle(color: Colors.black)))
          ]),
          const SizedBox(height: 15),
          // Location
          InkWell(
              onTap: () => launch(
                  'https://www.google.com/maps/place/I+P+College+Campus+2/@28.4257083,77.7929039,17z/data=!3m1!4b1!4m5!3m4!1s0x390ca3a1c057c3b9:0x381bcd3712b4767f!8m2!3d28.4257083!4d77.7950926'),
              child: Icon(Icons.location_on, color: Colors.teal[900])),
          InkWell(
              onTap: () => launch(
                  'https://www.google.com/maps/place/I+P+College+Campus+2/@28.4257083,77.7929039,17z/data=!3m1!4b1!4m5!3m4!1s0x390ca3a1c057c3b9:0x381bcd3712b4767f!8m2!3d28.4257083!4d77.7950926'),
              child: const Text(
                  "Address: NH91, BulandShahr-Delhi Road, BulandShahr-203001(U.P.)",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center)),
          const SizedBox(height: 20),
          // Terms And Condition
          Text("Terms and Condition:-",
              style: TextStyle(
                  color: Colors.teal[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          const SizedBox(height: 15),
          const Text(
              "Refund Policy \n Online Payment Policy \n Privacy Policy \n Terms and Condition",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center),
          const SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            // Twitter
            InkWell(
                onTap: () => launch('https://twitter.com/bsr_ip'),
                child:
                    FaIcon(FontAwesomeIcons.twitter, color: Colors.teal[900])),
            // FaceBook
            InkWell(
                onTap: () =>
                    launch('https://www.facebook.com/ipcollegecampus2/'),
                child: FaIcon(FontAwesomeIcons.facebookF,
                    color: Colors.teal[900])),
            //College WebSite
            InkWell(
                onTap: () => launch('http://ipcollegebsr.org/new/index.html#'),
                child:
                    FaIcon(FontAwesomeIcons.google, color: Colors.teal[900])),
            // Mail
            InkWell(
                onTap: () => launch('mailto: director@ipcollegebsr.org'),
                child: FaIcon(FontAwesomeIcons.inbox, color: Colors.teal[900])),
            // Youtube
            InkWell(
                onTap: () => launch(
                    'https://youtube.com/playlist?list=PL8LTmzy_GahEvq2VYzIJnNDS7wChBxWLX'),
                child:
                    FaIcon(FontAwesomeIcons.youtube, color: Colors.teal[900]))
          ])
        ]));
  }
}
