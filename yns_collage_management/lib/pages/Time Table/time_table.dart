import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yns_college_management/Utils/utils.dart';
import 'package:yns_college_management/Widgets/time_table_card.dart';

class TimeTablePage extends StatefulWidget {
  String uid;

  TimeTablePage({required this.uid, super.key});

  @override
  State<TimeTablePage> createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  //fetch user Data
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
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text('Time Table'),
            elevation: 0,
            // actions: [
            //   Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //       child: IconButton(
            //           icon: const Icon(
            //             Icons.filter_alt,
            //           ),
            //           onPressed: () {}))
            // ],
            backgroundColor: Colors.transparent),
        body: StreamBuilder(
          stream: (userData['role'] != 'student')
              ? FirebaseFirestore.instance.collection('timeTable').snapshots()
              : FirebaseFirestore.instance
                  .collection('timeTable')
                  .where('Class', isEqualTo: userData['Class'])
                  .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              );
            }
            return (snapshot.data!.docs.length != 0)
                ? ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (ctx, index) => Container(
                      margin: const EdgeInsets.symmetric(),
                      child: TimeTableCard(
                        uid: userData['uid'],
                        snap: snapshot.data!.docs[index].data(),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        child: Lottie.asset('assets/images/img59.json'),
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        "TIME TABLE NOT AVAILABLE*",
                        style: TextStyle(
                            color: Color.fromARGB(255, 7, 226, 62),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  );
          },
        ));
  }
}
