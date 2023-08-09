import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CheckAttendance extends StatefulWidget {
  const CheckAttendance({super.key});
  @override
  State<CheckAttendance> createState() => _CheckAttendanceState();
}

class _CheckAttendanceState extends State<CheckAttendance> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text('Check Attendance'),
            elevation: 0,
            backgroundColor: Colors.transparent),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: mediaQuery.size.height * 0.5,
            child: Lottie.asset('assets/images/img58.json'),
          ),
          const Center(
              child: Text("Oops!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 35)))
        ])));
  }
}
