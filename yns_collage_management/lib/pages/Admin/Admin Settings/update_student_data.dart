// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, prefer_typing_uninitialized_variables
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:yns_college_management/widgets/input_field_student_registration.dart';
import '../../../Resources/auth_method.dart';
import '../../../Utils/utils.dart';
import '../../../Widgets/siginup_and_login_page_widget.dart';

class UpdateStudentDataPage extends StatefulWidget {
  String uid;
  UpdateStudentDataPage({super.key, required this.uid});
  @override
  State<UpdateStudentDataPage> createState() => _UpdateStudentDataPageState();
}

class _UpdateStudentDataPageState extends State<UpdateStudentDataPage> {
  var role = 'student';
  var selectedClass = '0';

  var gender = '';
  var transport = '';
  var Category = '';

  //controller
  bool _isLoading = false;
  TextEditingController sessionController = TextEditingController();

  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherController = TextEditingController();
  final TextEditingController motherController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController aadharController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController IncomeController = TextEditingController();
  final TextEditingController AddressController = TextEditingController();
  final TextEditingController MobileController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  Uint8List? _image;

  var dropdowndepartment;
  var department = [
    'Computer Science Dep.',
    'Commerce & Business Dep.',
    'Teacher Education Dep.',
    'Department of Science.',
  ];

  @override
  void dispose() {
    super.dispose();
    sessionController.dispose();
    // classController.dispose();
    idController.dispose();
    nameController.dispose();
    fatherController.dispose();
    motherController.dispose();
    dateController.dispose();
    aadharController.dispose();
    occupationController.dispose();
    IncomeController.dispose();
    AddressController.dispose();
    MobileController.dispose();
    EmailController.dispose();
    PasswordController.dispose();
  }

// for picking up image from gallery
  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);

    if (file != null) {
      return await file.readAsBytes();
    }
    // print('No Image Selected');
  }

  //select image
  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);

    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

//fetch Data
  bool isLoading = false;
  var userData = {};

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
    getUserData();
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: (const Text("Update Student Detail")),
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
                      child: Text("Update\nStudent Detail",
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
                              TextFormField(
                                  // initialValue: userData['name'],
                                  controller: sessionController,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white),
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                      hintText: userData['name'],
                                      hintStyle: const TextStyle(
                                          fontStyle: FontStyle.normal,
                                          color: Color.fromARGB(117, 0, 0, 0)),
                                      // labelText: userData['name'],
                                      labelStyle: const TextStyle(
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                      // prefixIcon: Icon(widget.icon, color: Colors.white),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              width: 2)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  117, 255, 255, 255),
                                              width: 1.5)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),

                              // Academic Session...
                              Row(children: [
                                const Text('Academic Session:'),
                                Expanded(
                                    child: InputFieldStudentRegistration(
                                        textEditingController:
                                            sessionController,
                                        keyboard: const TextInputType
                                            .numberWithOptions(signed: true)))
                              ]),

                              //                     // Department
                              //                     Row(children: [
                              //                       const Text('Department:'),
                              //                       Expanded(
                              //                           child: Padding(
                              //                               padding:
                              //                                   const EdgeInsets.only(left: 20),
                              //                               child: DropdownButton(
                              //                                   dropdownColor: Colors.teal[400],
                              //                                   hint:
                              //                                       const Text('Select Department'),
                              //                                   menuMaxHeight: 300,
                              //                                   isExpanded: true,
                              //                                   underline: Container(
                              //                                     color: Colors.teal[800],
                              //                                     height: 1,
                              //                                   ),
                              //                                   iconEnabledColor: Colors.teal[800],
                              //                                   style: const TextStyle(
                              //                                       color: Color.fromARGB(
                              //                                           255, 13, 71, 161),
                              //                                       fontSize: 13),
                              //                                   value: dropdowndepartment,
                              //                                   icon: const Icon(
                              //                                       Icons.keyboard_arrow_down),
                              //                                   items:
                              //                                       department.map((String items) {
                              //                                     return DropdownMenuItem(
                              //                                         value: items,
                              //                                         child: Text(items));
                              //                                   }).toList(),
                              //                                   onChanged: (newValue) {
                              //                                     setState(() {
                              //                                       dropdowndepartment = newValue!;
                              //                                     });
                              //                                   })))
                              //                     ]),

                              //                     // class...
                              //                     SizedBox(
                              //                       width: MediaQuery.of(context).size.width * 0.9,
                              //                       child: Row(children: [
                              //                         const Text(
                              //                           'Class:',
                              //                         ),
                              //                         Expanded(
                              //                             child: Padding(
                              //                                 padding: const EdgeInsets.symmetric(
                              //                                     horizontal: 20),
                              //                                 child: StreamBuilder<QuerySnapshot>(
                              //                                     stream: FirebaseFirestore.instance
                              //                                         .collection('courses')
                              //                                         .where('department',
                              //                                             isEqualTo:
                              //                                                 dropdowndepartment)
                              //                                         .snapshots(),
                              //                                     builder: (context, snapshot) {
                              //                                       List<DropdownMenuItem> Class =
                              //                                           [];
                              //                                       if (!snapshot.hasData) {
                              //                                         const CircularProgressIndicator();
                              //                                       } else {
                              //                                         final Classes = snapshot
                              //                                             .data?.docs.reversed
                              //                                             .toList();
                              //                                         Class.add(
                              //                                             const DropdownMenuItem(
                              //                                                 value: '0',
                              //                                                 child: Text(
                              //                                                     'Select Class',
                              //                                                     style: TextStyle(
                              //                                                         color: Color
                              //                                                             .fromARGB(
                              //                                                                 255,
                              //                                                                 1,
                              //                                                                 44,
                              //                                                                 40)))));
                              //                                         for (var users in Classes!) {
                              //                                           Class.add(DropdownMenuItem(
                              //                                               value: users.id,
                              //                                               child: Text(
                              //                                                   users['cName'])));
                              //                                         }
                              //                                       }
                              //                                       return DropdownButton(
                              //                                         dropdownColor:
                              //                                             Colors.teal[400],
                              //                                         menuMaxHeight: 300,
                              //                                         underline: Container(
                              //                                           color: Colors.teal[800],
                              //                                           height: 1,
                              //                                         ),
                              //                                         iconEnabledColor:
                              //                                             Colors.teal[800],
                              //                                         style: const TextStyle(
                              //                                             color: Color.fromARGB(
                              //                                                 255, 13, 71, 161),
                              //                                             fontSize: 13),
                              //                                         icon: const Icon(Icons
                              //                                             .keyboard_arrow_down),
                              //                                         items: Class,
                              //                                         onChanged: (usersValue) {
                              //                                           setState(() {
                              //                                             selectedClass =
                              //                                                 usersValue;
                              //                                             // getClassData();
                              //                                           });
                              //                                         },
                              //                                         value: selectedClass,
                              //                                         isExpanded: false,
                              //                                       );
                              //                                     })))
                              //                       ]),
                              //                     ),

                              //                     // rollno...
                              //                     Row(children: [
                              //                       const Text('University Roll No.:'),
                              //                       Expanded(
                              //                           child: InputFieldStudentRegistration(
                              //                               textEditingController: idController,
                              //                               keyboard: TextInputType.text))
                              //                     ])
                              //                   ]))
                              //         ]))),
                              // //image
                              // Padding(
                              //     padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
                              //     child: Container(
                              //         width: double.infinity,
                              //         decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(20),
                              //             color: Colors.teal[400]),
                              //         child: Center(
                              //           child: Padding(
                              //               padding: const EdgeInsets.all(12),
                              //               child: Stack(
                              //                 children: [
                              //                   _image != null
                              //                       ? CircleAvatar(
                              //                           radius: 64,
                              //                           backgroundImage: MemoryImage(_image!),
                              //                           backgroundColor: Colors.teal,
                              //                         )
                              //                       : const CircleAvatar(
                              //                           radius: 64,
                              //                           backgroundImage: NetworkImage(
                              //                               'https://i.stack.imgur.com/l60Hf.png'),
                              //                           backgroundColor: Colors.teal,
                              //                         ),
                              //                   Positioned(
                              //                     bottom: -10,
                              //                     left: 80,
                              //                     child: IconButton(
                              //                       onPressed: selectImage,
                              //                       icon: const Icon(
                              //                         Icons.add_a_photo,
                              //                         color: Color.fromARGB(255, 0, 73, 65),
                              //                       ),
                              //                     ),
                              //                   )
                              //                 ],
                              //               )),
                              //         ))),
                              // Padding(
                              //     padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
                              //     child: Container(
                              //         width: double.infinity,
                              //         decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(20),
                              //             color: Colors.teal[400]),
                              //         child: Column(children: [
                              //           Padding(
                              //               padding: const EdgeInsets.all(12),
                              //               child: Column(
                              //                   crossAxisAlignment: CrossAxisAlignment.start,
                              //                   children: [
                              //                     // student name...
                              //                     Row(children: [
                              //                       const Text('Name of Candidate:'),
                              //                       Expanded(
                              //                           child: InputFieldStudentRegistration(
                              //                               textEditingController: nameController,
                              //                               keyboard: TextInputType.name))
                              //                     ]),
                              //                     // father name...
                              //                     Row(children: [
                              //                       const Text("Father's Name:"),
                              //                       Expanded(
                              //                           child: InputFieldStudentRegistration(
                              //                               textEditingController: fatherController,
                              //                               keyboard: TextInputType.name))
                              //                     ]),
                              //                     // mother name...
                              //                     Row(children: [
                              //                       const Text("Mother's Name:"),
                              //                       Expanded(
                              //                           child: InputFieldStudentRegistration(
                              //                               textEditingController: motherController,
                              //                               keyboard: TextInputType.name))
                              //                     ]),
                              //                     // student dob...
                              //                     Row(children: [
                              //                       const Text("Date of Birth:"),
                              //                       Expanded(
                              //                           child: Padding(
                              //                               padding: const EdgeInsets.all(20.0),
                              //                               child: TextField(
                              //                                 style: TextStyle(
                              //                                     fontSize: 13,
                              //                                     fontStyle: FontStyle.normal,
                              //                                     color: Colors.blue[900]),
                              //                                 controller: dateController,
                              //                                 decoration: const InputDecoration(
                              //                                     contentPadding: EdgeInsets.all(8),
                              //                                     icon: Icon(
                              //                                       Icons.calendar_today_rounded,
                              //                                       // color: Colors.teal[800],
                              //                                     ),
                              //                                     hintText: "Select Date"),
                              //                                 onTap: () async {
                              //                                   DateTime? pickedDate =
                              //                                       await showDatePicker(
                              //                                           context: context,
                              //                                           initialDate: DateTime.now(),
                              //                                           firstDate: DateTime(1900),
                              //                                           lastDate: DateTime.now());
                              //                                   if (pickedDate != null) {
                              //                                     setState(() {
                              //                                       dateController.text =
                              //                                           DateFormat('dd-MM-yyyy')
                              //                                               .format(pickedDate);
                              //                                     });
                              //                                   }
                              //                                 },
                              //                               )))
                              //                     ]),
                              //                     // aadhar number...
                              //                     Row(children: [
                              //                       const Text("Aadhar No:"),
                              //                       Expanded(
                              //                           child: InputFieldStudentRegistration(
                              //                               textEditingController: aadharController,
                              //                               keyboard: TextInputType.datetime))
                              //                     ])
                              //                   ]))
                              //         ]))),
                              // Padding(
                              //     padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
                              //     child: Container(
                              //         width: double.infinity,
                              //         decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(20),
                              //             color: Colors.teal[400]),
                              //         child: Padding(
                              //             padding: const EdgeInsets.all(12.0),
                              //             child: Column(
                              //                 mainAxisAlignment: MainAxisAlignment.start,
                              //                 children: [
                              //                   // gender...
                              //                   const Text("GENDER"),
                              //                   FittedBox(
                              //                       child: Row(
                              //                           mainAxisAlignment: MainAxisAlignment.start,
                              //                           children: [
                              //                         const Text('Male'),
                              //                         Radio(
                              //                             value: 'male',
                              //                             groupValue: gender,
                              //                             onChanged: (value) {
                              //                               setState(() {
                              //                                 gender = value.toString();
                              //                               });
                              //                             }),
                              //                         SizedBox(width: mediaQuery.size.width * 0.1),
                              //                         const Text('female'),
                              //                         Radio(
                              //                             value: 'female',
                              //                             groupValue: gender,
                              //                             onChanged: (value) {
                              //                               setState(() {
                              //                                 gender = value.toString();
                              //                               });
                              //                             }),
                              //                         SizedBox(width: mediaQuery.size.width * 0.1),
                              //                         const Text('Other'),
                              //                         Radio(
                              //                             value: 'other',
                              //                             groupValue: gender,
                              //                             onChanged: (value) {
                              //                               setState(() {
                              //                                 gender = value.toString();
                              //                               });
                              //                             })
                              //                       ])),
                              //                   const Divider(
                              //                       color: Colors.teal,
                              //                       height: 25,
                              //                       thickness: 1,
                              //                       indent: 5,
                              //                       endIndent: 5),
                              //                   // category...
                              //                   const Text("CATEGORY"),
                              //                   FittedBox(
                              //                       child: Row(
                              //                           mainAxisAlignment: MainAxisAlignment.start,
                              //                           children: [
                              //                         const Text('Gen'),
                              //                         Radio(
                              //                             value: 'gen',
                              //                             groupValue: Category,
                              //                             onChanged: (value) {
                              //                               setState(() {
                              //                                 Category = value.toString();
                              //                               });
                              //                             }),
                              //                         SizedBox(width: mediaQuery.size.width * 0.1),
                              //                         const Text('OBC'),
                              //                         Radio(
                              //                             value: 'OBC',
                              //                             groupValue: Category,
                              //                             onChanged: (value) {
                              //                               setState(() {
                              //                                 Category = value.toString();
                              //                               });
                              //                             }),
                              //                         SizedBox(width: mediaQuery.size.width * 0.1),
                              //                         const Text('SC'),
                              //                         Radio(
                              //                             value: 'SC',
                              //                             groupValue: Category,
                              //                             onChanged: (value) {
                              //                               setState(() {
                              //                                 Category = value.toString();
                              //                               });
                              //                             }),
                              //                         SizedBox(width: mediaQuery.size.width * 0.1),
                              //                         const Text('ST'),
                              //                         Radio(
                              //                             value: 'ST',
                              //                             groupValue: Category,
                              //                             onChanged: (value) {
                              //                               setState(() {
                              //                                 Category = value.toString();
                              //                               });
                              //                             })
                              //                       ])),
                              //                   const Divider(
                              //                       color: Colors.teal,
                              //                       height: 25,
                              //                       thickness: 1,
                              //                       indent: 5,
                              //                       endIndent: 5),
                              //                   // occupation and income...
                              //                   const Text("Guardian's"),
                              //                   Row(children: [
                              //                     const Text("Occupation:"),
                              //                     Expanded(
                              //                         child: InputFieldStudentRegistration(
                              //                             textEditingController:
                              //                                 occupationController,
                              //                             keyboard: TextInputType.text))
                              //                   ]),
                              //                   Row(children: [
                              //                     const Text("Income(Per Annum):"),
                              //                     Expanded(
                              //                         child: InputFieldStudentRegistration(
                              //                             textEditingController: IncomeController,
                              //                             keyboard: TextInputType.datetime))
                              //                   ])
                              //                 ])))),

                              // Padding(
                              //     padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
                              //     child: Container(
                              //         width: double.infinity,
                              //         decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(20),
                              //             color: Colors.teal[400]),
                              //         child: Padding(
                              //             padding: const EdgeInsets.all(12.0),
                              //             child: Column(
                              //                 mainAxisAlignment: MainAxisAlignment.start,
                              //                 children: [
                              //                   // College Transport...
                              //                   const Text("Use College Transport"),
                              //                   FittedBox(
                              //                       child: Row(
                              //                           mainAxisAlignment: MainAxisAlignment.start,
                              //                           children: [
                              //                         const Text('Yes'),
                              //                         Radio(
                              //                             value: 'Yes',
                              //                             groupValue: transport,
                              //                             onChanged: (value) {
                              //                               setState(() {
                              //                                 transport = value.toString();
                              //                               });
                              //                             }),
                              //                         SizedBox(width: mediaQuery.size.width * 0.1),
                              //                         const Text('No'),
                              //                         Radio(
                              //                             value: 'No',
                              //                             groupValue: transport,
                              //                             onChanged: (value) {
                              //                               setState(() {
                              //                                 transport = value.toString();
                              //                               });
                              //                             }),
                              //                       ])),
                              //                 ])))),

                              // Padding(
                              //     padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
                              //     child: Container(
                              //         width: double.infinity,
                              //         decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(20),
                              //             color: Colors.teal[400]),
                              //         child: Column(children: [
                              //           Padding(
                              //               padding: const EdgeInsets.all(12),
                              //               child: Column(
                              //                   crossAxisAlignment: CrossAxisAlignment.start,
                              //                   children: [
                              //                     Row(children: [
                              //                       // address...
                              //                       const Text('Address:'),
                              //                       Expanded(
                              //                           child: InputFieldStudentRegistration(
                              //                               textEditingController:
                              //                                   AddressController,
                              //                               keyboard: TextInputType.text))
                              //                     ]),
                              //                     // phone number...
                              //                     Row(children: [
                              //                       const Text("Mobile NO:"),
                              //                       Expanded(
                              //                           child: InputFieldStudentRegistration(
                              //                               textEditingController: MobileController,
                              //                               keyboard: TextInputType.datetime))
                              //                     ]),

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
                                              // AddStudent();
                                              print('------>');
                                              print(sessionController);
                                              print('------>');

                                              FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(widget.uid)
                                                  .update({
                                                'session':
                                                    sessionController.text
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                                elevation: 20,
                                                backgroundColor:
                                                    Colors.teal[600],
                                                shadowColor: Colors.teal[600],
                                                side: BorderSide(
                                                    color: Colors.teal.shade600,
                                                    width: 2,
                                                    style: BorderStyle.solid),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0)),
                                                minimumSize:
                                                    const Size(130, 50)),
                                            child: !_isLoading
                                                ? const Text('Submit')
                                                : const CircularProgressIndicator(
                                                    color: Color.fromARGB(
                                                        255, 115, 162, 170)))
                                      ]))
                            ]))
                  ]))),
          const SizedBox(height: 20.0)
        ])));
  }
}
