// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/Utils/utils.dart';
import 'attendance_taker.dart';

class AttendanceForm extends StatefulWidget {
  var name;
  AttendanceForm({required this.name, super.key});
  @override
  State<AttendanceForm> createState() => _AttendanceFormState();
}

class _AttendanceFormState extends State<AttendanceForm> {
  final TextEditingController dateController = TextEditingController();

  String dropdownDepartment = 'Computer Science Dep.';
  var selectedTeacher = '0';
  var selectedClass = '0';
  String dropdownsubject = 'Mathematics';

  var Department = [
    'Computer Science Dep.',
    'Commerce & Business Dep.',
    'Teacher Education Dep.',
    'Department of Science.',
  ];

  var subject = [
    'Mathematics',
    'Programming Principle and Algorithm',
    'Fundamental of Computer MS Office',
    'Principle of Management',
    'Business Communication',
    'C Programming Language',
    'Organization Behavior',
    'Digital Electronics',
    'Financial Management and Accounting',
    'C++',
    'Data Structure',
    'Computer Architecture',
    'Business Economics',
    'Statistics',
    'Computer Graphics',
    'Operating System',
    'Optimization Techniques',
    'Software Engineering',
    'DBMS',
    'Java and Web technology',
    'Networking',
    'Numerical Techniques',
    'Knowledge Management',
    'Network Security',
    'E -Commerce',
    'System Analysis and Design',
    'Foundation Course in Computers',
    'Programming in C and data structure',
    'Discrete Mathematical Structures',
    'Computer Oriented Statistical Techniques',
    'Design and analysis of Algorithms',
    'File Structure and Database Management System',
    'Computer Oriented Numerical Analysis',
    'Interactive Computer Graphics',
    'Computer Networks and Internet',
    'Computer Oriented Optimization Methods',
    'Object Oriented System',
    'Fuzzy sets and Applications',
    'Cryptology and Secure Systems',
    'Artificial Intelligence and Neural networks',
    'Fundamentals of Management',
    'OrganizationalBehavior',
    'Managerial Economics',
    'Accounting and Financial Analysis',
    'Business Law',
    'BusinessOrganization and Ethics',
    'Quantitative Techniques for Business',
    'Business Communication',
    'Human Resource Management',
    'Marketing Management',
    'Business Environment',
    'Fundamentals of Computer',
    'Advertising Management',
    'Team Building & Leadership',
    'Indian Economy',
    'Customer Relationship Management',
    'Management Information System',
    'ConsumerBehavior',
    'Financial Management',
    'Production& Operation Management',
    'Sales& Distribution Management',
    'Research Methodology',
    'Entrepreneurship& Small Business Management',
    'Arithmetic Aptitude',
    'Aptitude Reasoning',
    'General Business Awareness',
    'General English',
    'Strategic Management & Business Policy',
    'Operation Research',
    'Fundamentals of E Commerce',
    'Economic and Industrial Law',
  ];

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

//fetch Data
  var userData = {};
  var cls;

  bool isLoading = false;

  void getUserData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('courses')
          .doc(selectedClass)
          .get();
      userData = userSnap.data()!;
      setState(() {
        cls = userData['cName'];
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

  @override
  Widget build(BuildContext context) {
    get();
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            elevation: 0, backgroundColor: Colors.teal[700], toolbarHeight: 32),
        body: Column(children: [
          Container(
              height: 280,
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
                Icon(Icons.edit_calendar, size: 180, color: Colors.white),
                Text('Attendance',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))
              ])),
          Expanded(
              child: SizedBox(
                  child: SingleChildScrollView(
                      child: Column(children: [
            // Select Department
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
                                    getUserData();
                                  });
                                },
                                value: selectedClass,
                                isExpanded: false,
                              );
                            })))),
            // Select Teacher
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
                                .where('role', isNotEqualTo: 'student')
                                // .where('email', isEqualTo: 'st@gmail.com')
                                .snapshots(),
                            builder: (context, snapshot) {
                              List<DropdownMenuItem> teacher = [];
                              if (!snapshot.hasData) {
                                const CircularProgressIndicator();
                              } else {
                                final teachers =
                                    snapshot.data?.docs.reversed.toList();
                                teacher.add(const DropdownMenuItem(
                                    value: '0', child: Text('Select Teacher')));
                                for (var users in teachers!) {
                                  teacher.add(DropdownMenuItem(
                                      value: users.id,
                                      child: Text(users['name'])));
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
                                items: teacher,
                                onChanged: (usersValue) {
                                  setState(() {
                                    selectedTeacher = usersValue;
                                  });
                                },
                                value: selectedTeacher,
                                isExpanded: false,
                              );
                            })))),
            // Select Subject
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
                        child: DropdownButton(
                            dropdownColor: Colors.teal[400],
                            hint: const Text('Select Subject'),
                            menuMaxHeight: 300,
                            isExpanded: true,
                            underline: Container(color: Colors.transparent),
                            iconEnabledColor: Colors.white,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                            value: dropdownsubject,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: subject.map((String items) {
                              return DropdownMenuItem(
                                  value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownsubject = newValue!;
                              });
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: AttendanceTaker(
                                  uid: selectedTeacher,
                                  date: dateController.text,
                                  Class: cls,
                                  subject: dropdownsubject)));
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
          ]))))
        ]));
  }
}
