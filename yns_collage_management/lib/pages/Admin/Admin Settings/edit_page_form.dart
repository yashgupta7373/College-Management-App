// ignore_for_file: must_be_immutable, use_build_context_synchronously, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/Utils/utils.dart';

import 'edit.dart';

class EditFormPage extends StatefulWidget {
  String role;
  EditFormPage({required this.role, super.key});

  @override
  State<EditFormPage> createState() => _EditFormPageState();
}

class _EditFormPageState extends State<EditFormPage> {
  var selectedStudent = '0';
  var selectedClass = '0';

  String dropdownDepartment = 'Computer Science Dep.';

  var Department = [
    'Computer Science Dep.',
    'Commerce & Business Dep.',
    'Teacher Education Dep.',
    'Department of Science.',
  ];

  final TextEditingController dateController = TextEditingController();

  //upload notice..
  bool isLoading = false;

  //fetch Data
  var ClassData = {};
  var cls;

  // bool isLoading = false;

  void getClassData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('courses')
          .doc(selectedClass)
          .get();
      ClassData = userSnap.data()!;
      setState(() {
        cls = ClassData['cName'];
      });
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

  //fetch Data
  var userData = {};

  void getUserData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(selectedStudent)
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
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Select Department
          Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                  width: mediaQuery.size.width * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.teal[500],
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.teal.shade500,
                            blurRadius: 15,
                            offset: const Offset(0, 10))
                      ]),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton(
                          dropdownColor: Colors.teal[400],
                          hint: const Text('Select Department'),
                          menuMaxHeight: 300,
                          isExpanded: true,
                          underline: Container(color: Colors.transparent),
                          iconEnabledColor: Colors.white,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                          value: dropdownDepartment,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: Department.map((String items) {
                            return DropdownMenuItem(
                                value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownDepartment = newValue!;
                              print(dropdownDepartment);
                            });
                          })))),
          // Select Class
          if (widget.role == 'student')
            Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                    width: mediaQuery.size.width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.teal[500],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.teal.shade500,
                              blurRadius: 15,
                              offset: const Offset(0, 10))
                        ]),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('courses')
                                .where('department',
                                    isEqualTo: dropdownDepartment)
                                .snapshots(),
                            builder: (context, snapshot) {
                              List<DropdownMenuItem> Class = [];
                              if (!snapshot.hasData) {
                                const CircularProgressIndicator();
                              } else {
                                final Classes =
                                    snapshot.data?.docs.reversed.toList();
                                Class.add(const DropdownMenuItem(
                                    value: '0', child: Text('Select Class')));
                                for (var users in Classes!) {
                                  Class.add(DropdownMenuItem(
                                      value: users.id,
                                      child: Text(users['cName'])));
                                }
                              }
                              return DropdownButton(
                                dropdownColor: Colors.teal[400],
                                menuMaxHeight: 300,
                                underline: Container(color: Colors.transparent),
                                iconEnabledColor: Colors.white,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: Class,
                                onChanged: (usersValue) {
                                  setState(() {
                                    selectedClass = usersValue;
                                    getClassData();
                                    print(cls);
                                  });
                                },
                                value: selectedClass,
                                isExpanded: false,
                              );
                            })))),
          if (widget.role == 'student')
            // Select Student
            Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                    width: mediaQuery.size.width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.teal[500],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.teal.shade500,
                              blurRadius: 15,
                              offset: const Offset(0, 10))
                        ]),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('users')
                                .where('role', isEqualTo: 'student')
                                .where('Class', isEqualTo: cls)
                                .snapshots(),
                            builder: (context, snapshot) {
                              List<DropdownMenuItem> student = [];
                              if (!snapshot.hasData) {
                                const CircularProgressIndicator();
                              } else {
                                final students =
                                    snapshot.data?.docs.reversed.toList();
                                student.add(const DropdownMenuItem(
                                    value: '0',
                                    child: Text('Select Student Roll-No.')));
                                for (var users in students!) {
                                  student.add(DropdownMenuItem(
                                      value: users.id,
                                      child: Text(users['id'])));
                                }
                              }
                              return DropdownButton(
                                dropdownColor: Colors.teal[400],
                                menuMaxHeight: 300,
                                underline: Container(color: Colors.transparent),
                                iconEnabledColor: Colors.white,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: student,
                                onChanged: (usersValue) {
                                  setState(() {
                                    selectedStudent = usersValue;
                                    getUserData();
                                    print(userData['id']);
                                  });
                                },
                                value: selectedStudent,
                                isExpanded: false,
                              );
                            })))),
          // Button
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (widget.role != 'student') {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: Edit(
                                role: widget.role,
                                department: dropdownDepartment,
                              )));
                    } else {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: Edit(
                                role: 'student',
                                department: dropdownDepartment,
                                Class: cls,
                                student: userData['id'],
                              )));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      shadowColor: Colors.teal[500],
                      side: BorderSide(
                          color: Colors.teal.shade500,
                          width: 2,
                          style: BorderStyle.solid),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      minimumSize: const Size(200, 45)),
                  child: const Text('Done',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))))
        ])));
  }
}
