// ignore_for_file: must_be_immutable, non_constant_identifier_names, deprecated_member_use, camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yns_college_management/Widgets/log_out.dart';
import '../../Widgets/call_class_room_and_online_class.dart';
import '../../Widgets/profile_widget.dart';
import '../Utils/utils.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  ProfilePage({super.key, required this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var present = "86", absent = "14";

  //fetch Data
  var userData = {};
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();
      userData = userSnap.data()!;
      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.teal[300],
            //aap bar
            appBar: AppBar(
                backgroundColor: Colors.teal[400],
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(userData['id']),
                      Row(children: const [
                        // google classroom, zoom, and logout...
                        CallClasses(),
                        SizedBox(width: 20),
                        LogOut()
                      ])
                    ]),
                elevation: 0),
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.teal[400],
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.elliptical(120, 90))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 8, left: 15),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                              backgroundColor:
                                                  Colors.transparent,
                                              content: InkWell(
                                                onTap: () =>
                                                    Navigator.of(ctx).pop(),
                                                child: Image.network(
                                                    userData['photoUrl']),
                                              )));
                                    },
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                          userData['photoUrl'],
                                        )),
                                  ),
                                  Expanded(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, bottom: 15),
                                            child: SizedBox(
                                                width: 180,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(userData['name'],
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .teal[900])),
                                                      Text(
                                                          (userData['role'] ==
                                                                      'admin' ||
                                                                  userData[
                                                                          'role'] ==
                                                                      'teacher')
                                                              ? userData[
                                                                  'profile']
                                                              : userData[
                                                                  'Class'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .teal[900])),
                                                      Text(
                                                          userData[
                                                              'department'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .teal[900])),
                                                      const SizedBox(height: 8),
                                                      if (userData['role'] ==
                                                          'student')
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              profileWidget(
                                                                  percent:
                                                                      '$present%',
                                                                  name:
                                                                      'PRESENTS'),
                                                              profileWidget(
                                                                  percent:
                                                                      '$absent%',
                                                                  name:
                                                                      'ABSENTS')
                                                            ])
                                                    ])))
                                      ]))
                                ])),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 60, right: 60, top: 20),
                            child: Container(
                                width: double.infinity,
                                height: 35,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(5, 10),
                                          blurRadius: 20,
                                          color: Colors.teal.shade900
                                              .withOpacity(0.6))
                                    ],
                                    color: Colors.teal[600],
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight:
                                            Radius.elliptical(120, 90))),
                                child: InkWell(
                                    onTap: (() {
                                      var number = userData['phoneNo'];
                                      launch('http://wa.me/+91$number');
                                    }),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                              FontAwesomeIcons
                                                  .facebookMessenger,
                                              color: Colors.white),
                                          SizedBox(width: 8),
                                          Text('Message',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white))
                                        ])))),
                        const SizedBox(height: 20)
                      ])),
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(children: [
                            // academic session
                            if (userData['role'] == 'student')
                              AdminRowWidget(
                                  text1: 'Academic Session:',
                                  text2: userData['session']),
                            // Id or RollNo
                            (userData['role'] == 'admin' ||
                                    userData['role'] == 'teacher')
                                ? AdminRowWidget(
                                    text1: '${userData['role']} Id:',
                                    text2: userData['id'])
                                : AdminRowWidget(
                                    text1: 'Roll-No.:', text2: userData['id']),
                            // profile or class
                            (userData['role'] == 'admin' ||
                                    userData['role'] == 'teacher')
                                ? AdminRowWidget(
                                    text1: 'Job Profile:',
                                    text2: userData['profile'])
                                : AdminRowWidget(
                                    text1: 'Class:', text2: userData['Class']),
                            // Department
                            AdminRowWidget(
                                text1: 'Department',
                                text2: userData['department']),
                            // Subjects for teachers
                            if (userData['role'] != 'student')
                              AdminRowWidget(
                                  text1: 'Subjects:',
                                  text2: userData[
                                      'subject']), // display all subjects...
                            // language for teachers
                            if (userData['role'] != 'student')
                              AdminRowWidget(
                                  text1: 'Language:',
                                  text2: userData[
                                      'language']), // display all language...
                            // Name
                            (userData['role'] == 'admin' ||
                                    userData['role'] == 'teacher')
                                ? AdminRowWidget(
                                    text1: '${userData['role']} Name:',
                                    text2: userData['name'])
                                : AdminRowWidget(
                                    text1: 'Student Name:',
                                    text2: userData['name']),
                            // Father Name
                            AdminRowWidget(
                                text1: 'Father\'s Name:',
                                text2: userData['fName']),
                            // Mother Name
                            AdminRowWidget(
                                text1: 'Mother\'s Name:',
                                text2: userData['mName']),
                            // Date fo Birth
                            AdminRowWidget(
                                text1: 'Date Of Birth:',
                                text2: userData['dob']),
                            // Aadhar card number
                            AdminRowWidget(
                                text1: 'Aadhar Card No.:',
                                text2: userData['aadharNo']),
                            // Gender
                            AdminRowWidget(
                                text1: 'Gender:', text2: userData['gender']),
                            // Category
                            if (userData['role'] == 'student')
                              AdminRowWidget(
                                  text1: 'Category:',
                                  text2: userData['category']),
                            // Guardian's Occupation
                            if (userData['role'] == 'student')
                              AdminRowWidget(
                                  text1: 'Guardian\'s Occupation:',
                                  text2: userData['gOccupation']),
                            // Guardian's Income
                            if (userData['role'] == 'student')
                              AdminRowWidget(
                                  text1: 'Guardian\'s Income:',
                                  text2: userData['gIncome']),
                            // Address
                            AdminRowWidget(
                                text1: 'Address:', text2: userData['address']),
                            // transport
                            AdminRowWidget(
                                text1: 'Use College Transport:',
                                text2: userData['transport']),
                            // Phone Number
                            AdminRowWidget(
                                text1: 'Phone Number:',
                                text2: userData['phoneNo']),
                            // Email Id
                            AdminRowWidget(
                                text1: 'Email Id:', text2: userData['email']),
                            const SizedBox(height: 10),
                            // social media icon
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                      onTap: () {},
                                      child: Icon(FontAwesomeIcons.facebook,
                                          color: Colors.teal[800])),
                                  InkWell(
                                      onTap: () {},
                                      child: Icon(FontAwesomeIcons.instagram,
                                          color: Colors.teal[800])),
                                  InkWell(
                                      onTap: () {},
                                      child: Icon(FontAwesomeIcons.twitter,
                                          color: Colors.teal[800])),
                                  InkWell(
                                      onTap: () {},
                                      child: Icon(Icons.mail,
                                          color: Colors.teal[800]))
                                ]),
                            const SizedBox(height: 60)
                          ]))))
            ]),
          );
  }
}
