// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/Utils/utils.dart';
import 'package:yns_college_management/pages/profile_page.dart';

class Transport extends StatefulWidget {
  String uid;
  Transport({required this.uid, super.key});
  @override
  State<Transport> createState() => _TransportState();
}

class _TransportState extends State<Transport> {
  //fetch user Data
  var userData = {};
  var collection;

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

  void transport() {
    if (userData['role'] == 'student') {
      collection = FirebaseFirestore.instance
          .collection('users')
          .where('id', isEqualTo: userData['id'])
          .where(
            'transport',
            isEqualTo: 'Yes',
          );
    } else if (userData['role'] == 'teacher') {
      collection = FirebaseFirestore.instance
          .collection('users')
          .where('department', isEqualTo: userData['department'])
          .where('transport', isEqualTo: 'Yes');
    } else if (userData['role'] == 'admin') {
      collection = FirebaseFirestore.instance.collection('users').where(
            'transport',
            isEqualTo: 'Yes',
          );
    }
  }

  //  List<Map<String, dynamic>> items;
  var items;
  bool isLoaded = false;
  void incrementCounter() async {
    List<Map<String, dynamic>> tempList = [];
    var data = await collection.get();
    for (var element in data.docs) {
      tempList.add(element.data());
    }

    setState(() {
      items = tempList;
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    transport();
    incrementCounter();
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // actions: [
        //   (userData['role'] != 'student')
        //       ? Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //           child: IconButton(
        //               icon: const Icon(
        //                 Icons.filter_alt,
        //               ),
        //               onPressed: () {}))
        //       : const Text('')
        // ],
      ),
      body: Column(children: [
        Center(
            child: Text("Bus Facility",
                textAlign: TextAlign.center,
                style: TextStyle(
                    shadows: [
                      Shadow(
                          color: Colors.teal.shade900,
                          blurRadius: 5,
                          offset: const Offset(2, 2))
                    ],
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
        Expanded(
            child: SingleChildScrollView(
          child: Column(children: [
            isLoaded
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(parent: null),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Card(
                          color: Colors.teal[700],
                          elevation: 5,
                          shadowColor: Colors.teal[500],
                          child: ListTile(
                              leading: InkWell(
                                  onTap: (() {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                            backgroundColor: Colors.transparent,
                                            content: InkWell(
                                              onTap: () =>
                                                  Navigator.of(ctx).pop(),
                                              child: Image.network(
                                                  items[index]['photoUrl']),
                                            )));
                                  }),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          (items[index]['photoUrl'])))),
                              title: Text(items[index]['name'],
                                  style: const TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              textColor: Colors.white,
                              subtitle: Text(items[index]['id']),
                              trailing: InkWell(
                                  onTap: (() {
                                    var uid = items[index]['uid'];
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child: ProfilePage(uid: uid)));
                                  }),
                                  child: const Icon(Icons.info,
                                      color: Colors.white))));
                    })
                : SizedBox(
                    height: mediaQuery.size.height * 0.85,
                    width: mediaQuery.size.width * 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ],
                    ),
                  ),
            if (items.length == 0)
              Column(
                children: [
                  SizedBox(
                    child: Lottie.asset('assets/images/img79.json'),
                  ),
                  const Text(
                    "YOU ARE NOT USING BUS FACILITY*",
                    style: TextStyle(
                        color: Color.fromARGB(255, 122, 17, 13),
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
          ]),
        ))
      ]),
    );
  }
}
