// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readmore/readmore.dart';
import 'package:yns_college_management/pages/photo_view_page.dart';

class TimeTableCard extends StatelessWidget {
  final snap;
  String uid;
  TimeTableCard({required this.snap, required this.uid, Key? key})
      : super(key: key);

  void deleteUser(id) {
    FirebaseFirestore.instance.collection('timeTable').doc(id).delete();
    Fluttertoast.showToast(msg: "TimeTable Deleted");
  }

  @override
  Widget build(BuildContext context) {
    var cls = snap['Class'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        color: Colors.teal[400],
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            // Title
            Row(
              children: [
                Expanded(
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      child: ReadMoreText(
                        snap['title'],
                        trimLines: 1,
                        textAlign: TextAlign.justify,
                        trimMode: TrimMode.Line,
                        lessStyle: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.normal),
                        moreStyle: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.normal),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                        useRootNavigator: false,
                        context: context,
                        builder: (context) {
                          return Dialog(
                              backgroundColor: Colors.teal[300],
                              child: SizedBox(
                                height: 120,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                        onTap: () => Navigator.pop(context),
                                        child: const Text('Share')),
                                    InkWell(
                                        onTap: () => Navigator.pop(context),
                                        child: const Text('Copy link')),
                                    InkWell(
                                        onTap: () => Navigator.pop(context),
                                        child: const Text('Save')),
                                    if (snap['uid'] == uid)
                                      InkWell(
                                          onTap: () {
                                            deleteUser(snap['docId']);
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Delete"))
                                  ],
                                ),
                              ));
                        },
                      );
                    },
                    icon: const Icon(Icons.more_vert, color: Colors.white)),
              ],
            ),

            // class
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Class: $cls',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                )),
            //Image Section
            SizedBox(
              // height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child:
                                  PhotoViewPage(image: snap['timeTableUrl'])));
                    },
                    child:
                        Image.network(snap['timeTableUrl'], fit: BoxFit.cover)),
              ),
            ),
            // Description
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: ReadMoreText(
                  snap['description'],
                  style: const TextStyle(
                    color: Color.fromARGB(174, 255, 255, 255),
                  ),
                  trimLines: 3,
                  textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,
                  lessStyle: const TextStyle(color: Colors.red),
                  moreStyle: const TextStyle(color: Colors.red),
                )),
            // date
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              child: Text(
                DateFormat.yMMMd().format(snap['datePublished'].toDate()),
                textAlign: TextAlign.end,
                style: const TextStyle(
                    fontSize: 14, color: Color.fromARGB(153, 255, 255, 255)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
