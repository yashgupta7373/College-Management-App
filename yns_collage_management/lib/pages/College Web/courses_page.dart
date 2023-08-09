import 'package:flutter/material.dart';
import 'package:yns_college_management/pages/College%20Web/footer.dart';
import 'package:yns_college_management/pages/College%20Web/header.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        // App Bar
        appBar: AppBar(
            title: const Text("Department And Courses"),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            backgroundColor: Colors.teal[700]),
        body: SingleChildScrollView(
            child: Column(children: [
          // Header
          const Headerpng(),
          //Heading
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: Text("Courses Offered & Seats Available",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.teal[900]),
                      textAlign: TextAlign.center))),
          Icon(Icons.compare_arrows, color: Colors.teal[900]),
          // Contact
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: Text(
                      "I.P. College , Campus-2 Bulandshahr (College Code: 955)",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.teal[900]),
                      textAlign: TextAlign.center))),
          Image.asset('assets/images/img36.jpg', fit: BoxFit.cover),
          const SizedBox(height: 20),
          //Footer
          const footer()
        ])));
  }
}
