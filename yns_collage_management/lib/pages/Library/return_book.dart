// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, non_constant_identifier_names, await_only_futures, unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/Utils/utils.dart';
import 'package:yns_college_management/pages/profile_page.dart';

import '../../Resources/firebase_method_for_library_old_record.dart';

class ReturnBook extends StatefulWidget {
  String uid;
  ReturnBook({super.key, required this.uid});
  @override
  State<ReturnBook> createState() => _ReturnBookState();
}

class _ReturnBookState extends State<ReturnBook> {
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

  var collection;

  void getData() async {
    if (userData['role'] == 'student') {
      collection = await FirebaseFirestore.instance
          .collection('library')
          .where('id', isEqualTo: userData['id']);
    } else {
      collection = await FirebaseFirestore.instance.collection('library');
    }
  }

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

  TextStyle style1 = const TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: 14,
      color: Color.fromARGB(255, 206, 216, 214),
      fontWeight: FontWeight.bold);

  void deleteUser(id) {
    FirebaseFirestore.instance.collection('library').doc(id).delete();
    Fluttertoast.showToast(msg: "Student Deleted");
  }

  //upload notice..
  // bool isLoading = false;
  var returnDate;
  void noticeImage(var Class, var name, var id, var book, var issueDate,
      var photoUrl, var uid) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      var res = await FireStoreMethods().libraryOldRecord(
        Class,
        name,
        id,
        book,
        issueDate,
        photoUrl,
        uid,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
      } else {
        showSnackBar(context, res);
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    var r = userData['role'];
    getData();
    incrementCounter();

    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: 0,
        // actions: [
        //   Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //       child: IconButton(
        //           icon: const Icon(
        //             Icons.filter_alt,
        //           ),
        //           onPressed: () {}))
        // ],
        title: const Text('Library Record'),
      ),
      body: Column(children: [
        Expanded(
            child: SingleChildScrollView(
                child: Column(children: [
          isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(parent: null),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: (() {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  backgroundColor:
                                      const Color.fromRGBO(100, 232, 222, 0.7),
                                  title: const Text('Detail',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18)),
                                  content: SizedBox(
                                    height: 195,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 40,
                                            backgroundImage: NetworkImage(
                                                (items[index]['photoUrl']))),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Name: ',
                                              style: style1,
                                            ),
                                            Text(items[index]['name'],
                                                style: style1),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Roll-No: ', style: style1),
                                            Text(items[index]['id'],
                                                style: style1),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Class: ', style: style1),
                                            Text(items[index]['Class'],
                                                style: style1),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Book: ', style: style1),
                                            Text(items[index]['book'],
                                                style: style1),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Issue Date: ', style: style1),
                                            Text(items[index]['issueDate'],
                                                style: style1),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )));
                        }),
                        child: Card(
                            color: Colors.teal[700],
                            elevation: 5,
                            shadowColor: Colors.teal[500],
                            child: ListTile(
                                leading: InkWell(
                                    onTap: (() {
                                      var uid = items[index]['uid'];

                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              child: ProfilePage(uid: uid)));
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
                                trailing: (userData['role'] != 'student')
                                    ? InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0)),
                                                  backgroundColor:
                                                      const Color.fromRGBO(
                                                          100, 232, 222, 0.7),
                                                  title: const Text(
                                                      'Are You Sure...',
                                                      style: TextStyle(
                                                          fontSize: 18)),
                                                  content: SizedBox(
                                                    height: 175,
                                                    child: Column(
                                                      children: [
                                                        CircleAvatar(
                                                            backgroundColor:
                                                                Colors.white,
                                                            radius: 40,
                                                            backgroundImage:
                                                                NetworkImage((items[
                                                                        index][
                                                                    'photoUrl']))),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Name: ',
                                                              style: style1,
                                                            ),
                                                            Text(
                                                                items[index]
                                                                    ['name'],
                                                                style: style1),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text('Roll-No: ',
                                                                style: style1),
                                                            Text(
                                                                items[index]
                                                                    ['id'],
                                                                style: style1),
                                                          ],
                                                        ),
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            ctx)
                                                                        .pop();
                                                                  },
                                                                  child: const Text(
                                                                      'No',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              17,
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              0,
                                                                              77,
                                                                              64)))),
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    noticeImage(
                                                                        items[index]
                                                                            [
                                                                            'Class'],
                                                                        items[index]
                                                                            [
                                                                            'name'],
                                                                        items[index]
                                                                            [
                                                                            'id'],
                                                                        items[index]
                                                                            [
                                                                            'book'],
                                                                        items[index]
                                                                            [
                                                                            'issueDate'],
                                                                        items[index]
                                                                            [
                                                                            'photoUrl'],
                                                                        items[index]
                                                                            [
                                                                            'uid']);
                                                                    deleteUser(items[
                                                                            index]
                                                                        [
                                                                        'docId']);
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: const Text(
                                                                      'Yes',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              17,
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              0,
                                                                              77,
                                                                              64))))
                                                            ]),
                                                      ],
                                                    ),
                                                  )));
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 90,
                                          decoration: const BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Return',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.info,
                                          color: Colors.white,
                                        )))));
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
                const SizedBox(height: 60),
                SizedBox(
                  child: Lottie.asset('assets/images/img81.json'),
                ),
                const Text(
                  "Library Record Not Found*",
                  style: TextStyle(
                      color: Color.fromARGB(255, 26, 106, 224),
                      fontWeight: FontWeight.bold),
                )
              ],
            )
        ])))
      ]),
    );
  }
}
