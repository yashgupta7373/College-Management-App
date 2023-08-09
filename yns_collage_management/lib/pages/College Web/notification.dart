// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text("Notifications"),
            elevation: 0,
            backgroundColor: Colors.transparent),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                    child: Column(children: [
                  SizedBox(
                      height: 180,
                      width: 180,
                      child: Lottie.asset('assets/images/img72.json')),
                  const SizedBox(height: 25),
                  Text("Notifications",
                      style: TextStyle(
                          shadows: [
                            Shadow(
                                color: Colors.teal.shade900,
                                blurRadius: 5,
                                offset: const Offset(2, 2))
                          ],
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  Column(children: [
                    const SizedBox(height: 15),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.teal[800],
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 1, color: Colors.teal.shade800),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.teal.shade900,
                                  spreadRadius: 1)
                            ]),
                        child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text("2022 Exam dates to release...",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)))),
                    const SizedBox(height: 15),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.teal[800],
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 1, color: Colors.teal.shade800),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.teal.shade900,
                                  spreadRadius: 1)
                            ]),
                        child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                                "Hurry up!!!\nAdmission Open For 2023...",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)))),
                    const SizedBox(height: 15),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.teal[800],
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 1, color: Colors.teal.shade800),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.teal.shade900,
                                  spreadRadius: 1)
                            ]),
                        child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                                "Answer for BCA 5th semester has been started uploading, Student can check them in application by clicking on specific question.",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)))),
                    const SizedBox(height: 15),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.teal[800],
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 1, color: Colors.teal.shade800),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.teal.shade900,
                                  spreadRadius: 1)
                            ]),
                        child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                                "JOB DESCRIPTION:-\nCompany: RS HR Team solutions private limited\nIndustry: IT-Software / Software services\nRole: IT software - Application Programming, maintenance\nLocation: Delhi\nSalary: 60,000 - 1,30,000",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)))),
                    const SizedBox(height: 15),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.teal[800],
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 1, color: Colors.teal.shade800),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.teal.shade900,
                                  spreadRadius: 1)
                            ]),
                        child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                                "JOB DESCRIPTION:-\nCompany: Evision technoserve Pvt Ltd.\nIndustry: IT-Software / Software services\nRole: Trainee\nLocation: Delhi NCR, Bareilly, Dehradun, Greater Noida\nSalary: 1,50,000 - 2,20,000",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white))))
                  ]),
                  const SizedBox(height: 60)
                ])))));
  }
}
