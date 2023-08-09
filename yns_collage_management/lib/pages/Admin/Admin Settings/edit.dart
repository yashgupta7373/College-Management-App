// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/pages/Admin/Admin%20Settings/update_student_data.dart';
import '../../profile_page.dart';

class Edit extends StatefulWidget {
  String role;
  final department, Class, student;
  Edit(
      {super.key,
      required this.role,
      this.department,
      this.Class,
      this.student});
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  var collection;
  void getData() {
    if (widget.role != 'student') {
      collection = FirebaseFirestore.instance
          .collection('users')
          .where(
            'role',
            isEqualTo: widget.role,
          )
          .where('department', isEqualTo: widget.department);
    } else {
      collection = FirebaseFirestore.instance
          .collection('users')
          .where(
            'role',
            isEqualTo: widget.role,
          )
          .where('department', isEqualTo: widget.department)
          .where('Class', isEqualTo: widget.Class)
          .where('id', isEqualTo: widget.student);
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
    FirebaseFirestore.instance.collection('users').doc(id).delete();
    Fluttertoast.showToast(msg: "User Deleted");
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    var r = widget.role;
    getData();
    incrementCounter();
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: 0,
        title: Text('Edit $r Details'),
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
                          var uid = items[index]['uid'];
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: ProfilePage(uid: uid)));
                        }),
                        child: Card(
                            color: Colors.teal[700],
                            elevation: 5,
                            shadowColor: Colors.teal[500],
                            child: ListTile(
                                leading: InkWell(
                                    onTap: (() {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                              backgroundColor:
                                                  Colors.transparent,
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
                                trailing: SizedBox(
                                  width: 80,
                                  child: Row(
                                    children: [
                                      InkWell(
                                          onTap: (() {
                                            // Navigator.push(
                                            //     context,
                                            //     PageTransition(
                                            //         type: PageTransitionType
                                            //             .rightToLeft,
                                            //         child:
                                            //             UpdateStudentDataPage(
                                            //                 uid: items[index]
                                            //                     ['uid'])));
                                          }),
                                          child: const Icon(Icons.edit,
                                              color: Color.fromARGB(
                                                  255, 47, 0, 255))),
                                      const SizedBox(width: 15),
                                      InkWell(
                                          onTap: (() {
                                            showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
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
                                                                          index]
                                                                      [
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
                                                                  style:
                                                                      style1),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text('Roll-No: ',
                                                                  style:
                                                                      style1),
                                                              Text(
                                                                  items[index]
                                                                      ['id'],
                                                                  style:
                                                                      style1),
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
                                                                      deleteUser(
                                                                          items[index]
                                                                              [
                                                                              'uid']);
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
                                ))));
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
