// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, must_be_immutable, use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yns_college_management/Utils/utils.dart';
import 'package:yns_college_management/widgets/input_field_student_registration.dart';

import '../../../Resources/firestore_method_for_courses.dart';

class AddCoursesPage extends StatefulWidget {
  String uid;
  AddCoursesPage({required this.uid, super.key});
  @override
  State<AddCoursesPage> createState() => _AddCoursesPageState();
}

class _AddCoursesPageState extends State<AddCoursesPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController feesController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  List<TextEditingController> listController = [TextEditingController()];
  var dropdowndepartment;
  var department = [
    'Computer Science Dep.',
    'Commerce & Business Dep.',
    'Teacher Education Dep.',
    'Department of Science.',
  ];

  //upload notice..
  bool isLoading = false;
  void noticeImage(String uid, String name, String photoUrl) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      var res = await FireStoreMethods().uploadCourse(
        uid,
        name,
        photoUrl,
        dropdowndepartment,
        idController.text,
        nameController.text,
        feesController.text,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          context,
          'Uploaded',
        );

        Navigator.pop(context);
        Navigator.pop(context);
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
  var userData = {};
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
            title: (const Text("Add Course ")),
            backgroundColor: Colors.transparent,
            elevation: 0),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // title...
          Center(
              child: SizedBox(
                  width: mediaQuery.size.width * 0.7,
                  height: mediaQuery.size.height * 0.15,
                  child: FittedBox(
                      child: Text("Add Course",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.teal.shade900,
                                    blurRadius: 5,
                                    offset: const Offset(2, 2))
                              ],
                              // fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))))),
          Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 2),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal[400]),
                  child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Department
                              Row(children: [
                                const Text('Department:'),
                                Expanded(
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: DropdownButton(
                                            dropdownColor: Colors.teal[400],
                                            hint:
                                                const Text('Select Department'),
                                            menuMaxHeight: 300,
                                            isExpanded: true,
                                            underline: Container(
                                              color: Colors.teal[800],
                                              height: 1,
                                            ),
                                            iconEnabledColor: Colors.teal[800],
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 13, 71, 161),
                                                fontSize: 13),
                                            value: dropdowndepartment,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items:
                                                department.map((String items) {
                                              return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items));
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                dropdowndepartment = newValue!;
                                              });
                                            })))
                              ]),
                              // ID...
                              Row(children: [
                                const Text('Course ID:'),
                                Expanded(
                                    child: InputFieldStudentRegistration(
                                        textEditingController: idController,
                                        keyboard: TextInputType.name))
                              ]),
                              // course...
                              Row(children: [
                                const Text('Course Name:'),
                                Expanded(
                                    child: InputFieldStudentRegistration(
                                        textEditingController: nameController,
                                        keyboard: TextInputType.name))
                              ]),

                              // Fees
                              Row(children: [
                                const Text('Fees:'),
                                Expanded(
                                    child: InputFieldStudentRegistration(
                                        textEditingController: feesController,
                                        keyboard: TextInputType.name))
                              ]),

                              // //Subject
                              // ListView.builder(
                              //   shrinkWrap: true,
                              //   itemCount: listController.length,
                              //   itemBuilder: (context, index) {
                              //     var n = index + 1;
                              //     return Row(
                              //       children: [
                              //         Text('Subject $n:'),
                              //         Expanded(
                              //           child: InputFieldStudentRegistration(
                              //               textEditingController:
                              //                   listController[index],
                              //               keyboard: TextInputType.name),
                              //         ),
                              //         const SizedBox(
                              //           width: 10,
                              //         ),
                              //         index != 0
                              //             ? GestureDetector(
                              //                 onTap: () {
                              //                   setState(() {
                              //                     listController[index].clear();
                              //                     listController[index]
                              //                         .dispose();
                              //                     listController
                              //                         .removeAt(index);
                              //                   });
                              //                 },
                              //                 child: const Icon(
                              //                   Icons.delete,
                              //                   color: Color.fromARGB(
                              //                       255, 197, 72, 72),
                              //                   size: 30,
                              //                 ),
                              //               )
                              //             : const SizedBox(),
                              //       ],
                              //     );
                              //   },
                              // ),
                              // const SizedBox(
                              //   height: 50,
                              // ),
                              // GestureDetector(
                              //   onTap: () {
                              //     setState(() {
                              //       listController.add(TextEditingController());
                              //     });
                              //   },
                              //   child: Container(
                              //     padding: const EdgeInsets.symmetric(
                              //         horizontal: 20, vertical: 15),
                              //     decoration: BoxDecoration(
                              //         color: Color.fromARGB(255, 0, 105, 92),
                              //         borderRadius: BorderRadius.circular(10)),
                              //     child: Text("Add More Subject",
                              //         style: GoogleFonts.nunito(
                              //             color: const Color(0xFFF8F8FF))),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   width: 10,
                              // ),
                            ])),

                    const SizedBox(height: 20.0),
                    // submit button...
                    Padding(
                        padding: const EdgeInsets.only(
                            right: 20, bottom: 15, top: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    noticeImage(userData['uid'],
                                        userData['name'], userData['photoUrl']);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      elevation: 20,
                                      backgroundColor: Colors.teal[600],
                                      shadowColor: Colors.teal[600],
                                      side: BorderSide(
                                          color: Colors.teal.shade600,
                                          width: 2,
                                          style: BorderStyle.solid),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      minimumSize: const Size(130, 50)),
                                  child: const Text("Submit"))
                            ])),
                    const SizedBox(height: 20.0)
                  ])))
        ])));
  }
}
