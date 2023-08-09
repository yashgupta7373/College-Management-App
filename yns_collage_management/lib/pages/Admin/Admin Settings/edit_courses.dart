// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, non_constant_identifier_names, prefer_const_constructors_in_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditCourse extends StatefulWidget {
  EditCourse({super.key});
  @override
  State<EditCourse> createState() => _EditCourseState();
}

class _EditCourseState extends State<EditCourse> {
  var collection;
  void getData() {
    collection = FirebaseFirestore.instance.collection('courses');
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
    FirebaseFirestore.instance.collection('courses').doc(id).delete();
    Fluttertoast.showToast(msg: "Course Deleted");
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    getData();
    incrementCounter();
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: 0,
        title: const Text('Edit Courses'),
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
                    return Card(
                        color: Colors.teal[700],
                        elevation: 5,
                        shadowColor: Colors.teal[500],
                        child: ListTile(
                            title: Text(items[index]['cName'],
                                style: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                            textColor: Colors.white,
                            subtitle: Text(items[index]['department']),
                            trailing: SizedBox(
                              width: 80,
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: (() {}),
                                      child: const Icon(Icons.edit,
                                          color:
                                              Color.fromARGB(255, 47, 0, 255))),
                                  const SizedBox(width: 15),
                                  InkWell(
                                      onTap: (() {
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
                                                  height: 120,
                                                  child: Column(
                                                    children: [
                                                      const SizedBox(
                                                          height: 15),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Course: ',
                                                            style: style1,
                                                          ),
                                                          Text(
                                                              items[index]
                                                                  ['cName'],
                                                              style: style1),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text('Course ID: ',
                                                              style: style1),
                                                          Text(
                                                              items[index]
                                                                  ['cId'],
                                                              style: style1),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            TextButton(
                                                                onPressed: () {
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
                                                                onPressed: () {
                                                                  deleteUser(items[
                                                                          index]
                                                                      [
                                                                      'docId']);
                                                                  Navigator.of(
                                                                          ctx)
                                                                      .pop();
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
                                      }),
                                      child: const Icon(Icons.delete,
                                          color: Colors.red)),
                                ],
                              ),
                            )));
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
                )
        ])))
      ]),
    );
  }
}
