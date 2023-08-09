// ignore_for_file: must_be_immutable, use_build_context_synchronously, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/Utils/utils.dart';
import 'package:yns_college_management/pages/Library/return_book.dart';

import '../../Resources/firestore_method_for_library.dart';

class IssueBook extends StatefulWidget {
  String uid;
  IssueBook({required this.uid, super.key});

  @override
  State<IssueBook> createState() => _IssueBookState();
}

class _IssueBookState extends State<IssueBook> {
  var selectedStudent = '0';
  var selectedClass = '0';

  String dropdownBook = 'Let us C (Yashavant Kanetkar)';
  String dropdownDepartment = 'Computer Science Dep.';

  var name, id, photoUrl;
  var Department = [
    'Computer Science Dep.',
    'Commerce & Business Dep.',
    'Teacher Education Dep.',
    'Department of Science.',
  ];
  var book = [
    'Let us C (Yashavant Kanetkar)',
    'C++ (Yashavant Kanetkar)',
    'Java (Rashmi Kanta Das)',
    'Python (John Shovic and Alan Simpson)',
    'Flutter (Dr. Deepti Chopra and Roopal Khurana)',
    'JavaScript (Berg Craig)',
    'Business Communication (Courtland L. Bovee/John V. Hill/Roshan Lal Raina)',
    'Business Law (Taxmann)',
    'Business Environment (K. Aswathappa)',
  ];
  // var author = [
  //   'Yashavant Kanetkar',
  //   'Rashmi Kanta Das',
  //   'John Shovic and Alan Simpson',
  //   'Dr. Deepti Chopra and Roopal Khurana',
  //   'Berg Craig',
  //   'Courtland L. Bovee/John V. Hill/Roshan Lal Raina',
  //   'Taxmann',
  //   'K. Aswathappa',
  // ];

  final TextEditingController dateController = TextEditingController();

  // Create Date-time Variable
  DateTime _dateTime = DateTime.now();
  void get() {
    dateController.text = DateFormat('dd-MM-yyyy').format(_dateTime);
  }

  // Show Date Picker Method
  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2030))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  //upload notice..
  bool isLoading = false;
  void noticeImage() async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      var res = await FireStoreMethods().libraryBook(
          name,
          photoUrl,
          id,
          dropdownBook,
          // dropdownAuthor,
          cls,
          selectedStudent,
          dateController.text);
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          context,
          'Book Issued',
        );

        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft,
                child: ReturnBook(uid: widget.uid)));
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
    get();
    name = userData['name'];
    id = userData['id'];
    photoUrl = userData['photoUrl'];
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            backgroundColor: Colors.teal[700], elevation: 0, toolbarHeight: 32),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
          Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.teal[700],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.teal.shade500,
                        blurRadius: 15,
                        offset: const Offset(0, 10))
                  ]),
              child: Column(children: const [
                Icon(Icons.edit_calendar, size: 120, color: Colors.white),
                Text('Book Issue',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))
              ])),
          const SizedBox(height: 40),
          // Select Book
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
                          hint: const Text('Select Book'),
                          menuMaxHeight: 300,
                          isExpanded: true,
                          underline: Container(color: Colors.transparent),
                          iconEnabledColor: Colors.white,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                          value: dropdownBook,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: book.map((String items) {
                            return DropdownMenuItem(
                                value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownBook = newValue!;
                            });
                          })))),
          // // Select Author
          // Padding(
          //     padding: const EdgeInsets.all(20),
          //     child: Container(
          //         width: mediaQuery.size.width * 0.7,
          //         decoration: BoxDecoration(
          //             color: Colors.teal[500],
          //             borderRadius: const BorderRadius.all(Radius.circular(15)),
          //             boxShadow: [
          //               BoxShadow(
          //                   color: Colors.teal.shade500,
          //                   blurRadius: 15,
          //                   offset: const Offset(0, 10))
          //             ]),
          //         child: Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 10),
          //             child: DropdownButton(
          //                 dropdownColor: Colors.teal[400],
          //                 hint: const Text('Select Author'),
          //                 menuMaxHeight: 300,
          //                 isExpanded: true,
          //                 underline: Container(color: Colors.transparent),
          //                 iconEnabledColor: Colors.white,
          //                 style: const TextStyle(
          //                     color: Colors.white, fontSize: 18),
          //                 value: dropdownAuthor,
          //                 icon: const Icon(Icons.keyboard_arrow_down),
          //                 items: author.map((String items) {
          //                   return DropdownMenuItem(
          //                       value: items, child: Text(items));
          //                 }).toList(),
          //                 onChanged: (String? newValue) {
          //                   setState(() {
          //                     dropdownAuthor = newValue!;
          //                   });
          //                 })))),

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
                            });
                          })))),
          // Select Class
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
                                });
                              },
                              value: selectedClass,
                              isExpanded: false,
                            );
                          })))),

          // Select Student
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
                                    value: users.id, child: Text(users['id'])));
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
                                });
                              },
                              value: selectedStudent,
                              isExpanded: false,
                            );
                          })))),
          // Select date
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                  onTap: _showDatePicker,
                  child: Container(
                      width: mediaQuery.size.width * 0.7,
                      height: 47,
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
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Display Date
                                Text(
                                    '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18)),
                                const Icon(Icons.edit_calendar,
                                    color: Colors.white)
                              ]))))),

          // Button
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: () {
                    noticeImage();
                    // print(userData['name']);
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
        ]))));
  }
}
