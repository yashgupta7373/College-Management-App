// ignore_for_file: non_constant_identifier_names, must_be_immutable, prefer_typing_uninitialized_variables, iterable_contains_unrelated_type, list_remove_unrelated_type, no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/pages/Attendance/attendance_overviwe.dart';
import 'package:yns_college_management/pages/profile_page.dart';

class AttendanceTaker extends StatefulWidget {
  var uid, date, Class, subject;
  // DateTime date;
  AttendanceTaker(
      {required this.uid,
      required this.date,
      required this.Class,
      required this.subject,
      super.key});

  @override
  State<AttendanceTaker> createState() => _AttendanceTakerState();
}

class _AttendanceTakerState extends State<AttendanceTaker> {
// fetch teacher name and photo form firebase
  var name = '', photoUrl = '';
  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .get();
    setState(() {
      name = (snap.data() as Map<String, dynamic>)['name'];
      photoUrl = (snap.data() as Map<String, dynamic>)['photoUrl'];
    });
  }

  var temp = [];
  var temp2 = [];

  var totalStudent = 0;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    // create and assign value to the variable
    var totalPresent = temp.length;
    var date = widget.date;
    var Class = widget.Class;
    var subject = widget.subject;

    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('users')
        .where(
          'Class',
          isEqualTo: Class,
        )
        .snapshots();

    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text('Attendance Taker'),
            backgroundColor: Colors.transparent,
            elevation: 0),
        body: Column(children: [
          Container(
            width: mediaQuery.size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.teal[700],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(80),
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.teal.shade500,
                      blurRadius: 15,
                      offset: const Offset(0, 10))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                    backgroundColor: Colors.transparent,
                                    content: InkWell(
                                      onTap: () => Navigator.of(ctx).pop(),
                                      child: Image.network(photoUrl),
                                    )));
                          },
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              backgroundImage: NetworkImage(photoUrl)),
                        ),
                        Column(children: [
                          Text('Date: $date',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white)),
                          Text('Teacher: $name',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white)),
                          Text('Class: $Class',
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white)),
                        ]),
                      ]),
                  Text('Subject: $subject',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(fontSize: 15, color: Colors.white)),
                  const SizedBox(height: 10),
                  Divider(
                    color: Colors.teal[300],
                    height: 0,
                    thickness: 0,
                    indent: 5,
                    endIndent: 5,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Total Student',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.teal[300])),
                          Text(
                            '$totalStudent',
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('Total Present',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.teal[300])),
                              Text(
                                '$totalPresent',
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder(
                    stream: _usersStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text("something is wrong");
                      }

                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  totalStudent = snapshot.data!.docs.length;
                                  if (temp.contains(snapshot
                                      .data!.docChanges[index].doc['name'])) {
                                    temp.remove(snapshot
                                        .data!.docChanges[index].doc['name']);
                                  } else {
                                    temp.add(snapshot
                                        .data!.docChanges[index].doc['name']);
                                  }
                                  if (temp2.contains(snapshot
                                      .data!.docChanges[index].doc['id'])) {
                                    temp2.remove(snapshot
                                        .data!.docChanges[index].doc['id']);
                                  } else {
                                    temp2.add(snapshot
                                        .data!.docChanges[index].doc['id']);
                                  }
                                });
                                setState(() {});
                              },
                              child: Card(
                                color: Colors.teal[700],
                                elevation: 5,
                                shadowColor: temp.contains(snapshot
                                        .data!.docChanges[index].doc['name'])
                                    ? Colors.green
                                    : Colors.red,
                                child: ListTile(
                                  leading: InkWell(
                                      onTap: (() {
                                        showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                            child: ProfilePage(
                                                              uid: snapshot
                                                                  .data!
                                                                  .docChanges[
                                                                      index]
                                                                  .doc['uid'],
                                                            )));
                                                  },
                                                  child: Image.network(snapshot
                                                      .data!
                                                      .docChanges[index]
                                                      .doc['photoUrl']),
                                                )));
                                      }),
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                              (snapshot.data!.docChanges[index]
                                                  .doc['photoUrl'])))),
                                  title: Text(
                                      snapshot
                                          .data!.docChanges[index].doc['name'],
                                      style: const TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  textColor: Colors.white,
                                  subtitle: Text(snapshot
                                      .data!.docChanges[index].doc['id']),
                                  trailing: Container(
                                    height: 40,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: temp.contains(snapshot.data!
                                              .docChanges[index].doc['name'])
                                          ? Colors.red
                                          : Colors.green,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        temp.contains(snapshot.data!
                                                .docChanges[index].doc['name'])
                                            ? 'Absent'
                                            : 'Present',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                //Buttons
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Reset button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal[700],
                          elevation: 20,
                          shadowColor: Colors.teal[900],
                          side: BorderSide(
                              color: Colors.teal.shade700,
                              width: 2,
                              style: BorderStyle.solid),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          minimumSize: const Size(150, 60),
                        ),
                        child: const Text('Reset'),
                      ),
                      //Done button
                      ElevatedButton(
                        onPressed: () {
                          var totalAbsent = totalStudent - totalPresent;
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: AttendanceOverViwe(
                                      totalStudent: totalStudent,
                                      totalPresent: totalPresent,
                                      totalAbsent: totalAbsent,
                                      list: temp,
                                      list2: temp2,
                                      Class: widget.Class,
                                      date: widget.date,
                                      subject: widget.subject)));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal[700],
                          elevation: 20,
                          shadowColor: Colors.teal[900],
                          side: BorderSide(
                              color: Colors.teal.shade700,
                              width: 2,
                              style: BorderStyle.solid),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          minimumSize: const Size(150, 60),
                        ),
                        child: const Text('Done'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
