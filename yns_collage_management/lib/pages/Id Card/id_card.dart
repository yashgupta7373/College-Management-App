// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yns_college_management/Utils/utils.dart';

class IdCard extends StatefulWidget {
  String uid;
  IdCard({required this.uid, super.key});

  @override
  State<IdCard> createState() => _IdCardState();
}

class _IdCardState extends State<IdCard> {
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

  //
  TextStyle style1 = TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.teal[900],
      fontWeight: FontWeight.bold);
  TextStyle style2 = const TextStyle(
      fontStyle: FontStyle.normal,
      color: Color.fromARGB(255, 88, 177, 162),
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    var role = userData['role'];
    var id = userData['id'];
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text('ID Card'),
            elevation: 0,
            backgroundColor: Colors.transparent),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: mediaQuery.size.height * 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //ID Card...
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 5),
                    child: InkWell(
                      child: Container(
                        // width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 243, 218, 218),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                            border: Border.all(
                                width: 1, color: Colors.teal.shade600),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.teal.shade900,
                                  spreadRadius: 1)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                "I.P.(P.G.) College, Campus-2, Bulandshahr",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal[900]),
                              ),
                              Text(
                                "N.H.-91, Bulandshahr-Delhi Road, \nBulandshahr(U.P.)  \n(College Code - 955)",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.teal[900]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    height: 170,
                                    width: 120,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/img30.png'),
                                          fit: BoxFit.fill),
                                    )),
                              ),
                              Text(
                                'IDENTITY CARD',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal[900]),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  backgroundColor:
                                      const Color.fromRGBO(100, 232, 222, 0.7),
                                  content: Container(
                                    height: 500,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25)),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.teal.shade600),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 10,
                                              color: Colors.teal.shade900,
                                              spreadRadius: 1)
                                        ]),
                                    child: Column(
                                      children: [
                                        Text(
                                          "I.P.(P.G.) College, Campus-2, Bulandshahr",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.teal[900]),
                                        ),
                                        Text(
                                          "N.H.-91, Bulandshahr-Delhi Road, \nBulandshahr(U.P.)  \n(College Code - 955)",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.teal[900]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 120,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                        Colors.teal.shade700),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      userData['photoUrl']),
                                                  fit: BoxFit.fill,
                                                )),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Column(
                                            children: [
                                              // name
                                              Text(
                                                userData['name'],
                                                style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 15,
                                                    color: Colors.teal[900],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              // class or profile
                                              Text(
                                                  (role == 'student')
                                                      ? userData['Class']
                                                      : userData['profile'],
                                                  style: style2),
                                              //session
                                              if (role == 'student')
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                              'Session:',
                                                              style: style1)),
                                                      Expanded(
                                                          child: Text(
                                                              userData[
                                                                  'session'],
                                                              style: style2))
                                                    ]),
                                              // rollNo, id
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                            (role == 'student')
                                                                ? '$role Roll-No:'
                                                                : '$role ID',
                                                            style: style1)),
                                                    Expanded(
                                                      child: Text(
                                                          userData['id'],
                                                          style: style2),
                                                    )
                                                  ]),
                                              //year
                                              if (role == 'student')
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                          child: Text('Year:',
                                                              style: style1)),
                                                      Expanded(
                                                          child: Text('',
                                                              style: style2))
                                                    ]),
                                              // Father Name
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                            'Father\'s Name:',
                                                            style: style1)),
                                                    Expanded(
                                                      child: Text(
                                                          userData['fName'],
                                                          style: style2),
                                                    )
                                                  ]),
                                              // Mother Name
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                            'Mother\'s Name:',
                                                            style: style1)),
                                                    Expanded(
                                                      child: Text(
                                                        userData['mName'],
                                                        style: style2,
                                                      ),
                                                    )
                                                  ]),
                                              //Phone NO
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                            'Phone No.:',
                                                            style: style1)),
                                                    Expanded(
                                                      child: Text(
                                                          userData['phoneNo'],
                                                          style: style2),
                                                    )
                                                  ]),
                                              // DOB
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                            'Date Of Birth:',
                                                            style: style1)),
                                                    Expanded(
                                                      child: Text(
                                                          userData['dob'],
                                                          style: style2),
                                                    )
                                                  ]),
                                              // Address
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        child: Text('Address:',
                                                            style: style1)),
                                                    Expanded(
                                                      child: Text(
                                                          userData['address'],
                                                          maxLines: 5,
                                                          style: style2),
                                                    )
                                                  ]),
                                              // Bus Facility
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                            'Bus Facility:',
                                                            style: style1)),
                                                    Expanded(
                                                      child: Text(
                                                          userData['transport'],
                                                          style: style2),
                                                    )
                                                  ]),
                                              const SizedBox(height: 8),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
