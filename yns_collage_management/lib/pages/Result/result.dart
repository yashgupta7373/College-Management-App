import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yns_college_management/Utils/utils.dart';
import 'package:yns_college_management/Widgets/result_card.dart';

class ResultPage extends StatefulWidget {
  String uid;
  ResultPage({required this.uid, super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
            title: const Text('Result'),
            elevation: 0,
            // actions: [
            //   Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //       child: IconButton(
            //           icon: Icon(
            //             Icons.filter_alt,
            //           ),
            //           onPressed: () {}))
            // ],
            backgroundColor: Colors.transparent),
        body: StreamBuilder(
          stream: (userData['role'] != 'student')
              ? FirebaseFirestore.instance.collection('result').snapshots()
              : FirebaseFirestore.instance
                  .collection('result')
                  .where('id', isEqualTo: userData['id'])
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
                      margin: EdgeInsets.symmetric(),
                      child: ResultCard(
                        uid: userData['uid'],
                        snap: snapshot.data!.docs[index].data(),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        child: Lottie.asset('assets/images/img71.json'),
                      ),
                      SizedBox(height: 50),
                      const Text(
                        "RESULT NOT AVAILABLE*",
                        style: TextStyle(
                            color: Color.fromARGB(255, 4, 103, 121),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  );
          },
        ));
  }
}
