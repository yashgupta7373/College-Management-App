// ignore_for_file: must_be_immutable, use_build_context_synchronously, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/Utils/utils.dart';
import 'package:yns_college_management/pages/Time%20Table/time_table.dart';

import '../../../Resources/firestore_method_for_time_table.dart';

class AddTimeTableScreen extends StatefulWidget {
  String uid;
  AddTimeTableScreen({required this.uid, super.key});

  @override
  State<AddTimeTableScreen> createState() => _AddTimeTableScreenState();
}

class _AddTimeTableScreenState extends State<AddTimeTableScreen> {
  Uint8List? _file;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  var dropdowndepartment;
  var selectedClass = '0';

  var department = [
    'Computer Science Dep.',
    'Commerce & Business Dep.',
    'Teacher Education Dep.',
    'Department of Science.',
  ];

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

// showDialog & select Image...
  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.teal[300],
          title: const Text('Upload Time Table'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  //upload TimeTable..
  void timeTableImage(String uid, String name, String photoUrl) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      String res = await FireStoreMethods().uploadTimeTable(
        _descriptionController.text,
        _file!,
        uid,
        name,
        photoUrl,
        cls,
        dropdowndepartment,
        _titleController.text,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          context,
          'TimeTable Uploaded!',
        );
        clearImage();
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: TimeTablePage(
                  uid: userData['uid'],
                )));
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

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

//fetch Class
  var userClass = {};
  var cls;

  void getClassData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('courses')
          .doc(selectedClass)
          .get();
      userClass = userSnap.data()!;
      setState(() {
        cls = userClass['cName'];
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
    return _file == null
        ? Container(
            color: const Color.fromARGB(155, 0, 0, 0),
            child: Center(
              child: TextButton(
                child: const Icon(Icons.upload, size: 40, color: Colors.white),
                onPressed: () => _selectImage(context),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.teal[300],
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: TimeTablePage(
                            uid: userData['uid'],
                          )));
                },
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text('Upload TimeTable'),
              actions: [
                TextButton(
                    onPressed: () {
                      timeTableImage(userData['uid'], userData['name'],
                          userData['photoUrl']);
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Upload',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.upload,
                          color: Colors.blueAccent,
                        ),
                      ],
                    ))
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  isLoading
                      ? const LinearProgressIndicator(
                          color: Colors.white,
                        )
                      : const Padding(padding: EdgeInsets.only(top: 0.0)),
                  const Divider(),
                  //Dp. Title, Image..
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Profile Image
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(userData['photoUrl']),
                      ),
                      //Title
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: TextField(
                          controller: _titleController,
                          cursorColor: const Color.fromARGB(171, 255, 255, 255),
                          style: const TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                              color: Colors.white),
                          decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                fontStyle: FontStyle.normal,
                                color: Color.fromARGB(117, 255, 255, 255),
                              ),
                              hintText: "Title...",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(117, 255, 255, 255),
                                      width: 1.5)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          maxLines: 2,
                        ),
                      ),
                      //Image
                      SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: AspectRatio(
                          aspectRatio: 487 / 451,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                border: Border.all(
                                    width: 1, color: Colors.teal.shade700),
                                image: DecorationImage(
                                  image: MemoryImage(_file!),
                                  fit: BoxFit.fill,
                                  alignment: FractionalOffset.topCenter,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  //Description
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextField(
                      controller: _descriptionController,
                      cursorColor: const Color.fromARGB(171, 255, 255, 255),
                      style: const TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          color: Colors.white),
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Color.fromARGB(117, 255, 255, 255),
                          ),
                          hintText: "Description...",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(117, 255, 255, 255),
                                  width: 1.5)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      maxLines: 10,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Department
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(children: [
                      const Text('Department:',
                          style: TextStyle(color: Colors.white)),
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: DropdownButton(
                                  dropdownColor: Colors.teal[300],
                                  hint: const Text('Select Department',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              153, 255, 255, 255))),
                                  menuMaxHeight: 300,
                                  isExpanded: true,
                                  underline: Container(
                                    color: Colors.white,
                                    height: 1,
                                  ),
                                  iconEnabledColor: Colors.white,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 13),
                                  value: dropdowndepartment,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: department.map((String items) {
                                    return DropdownMenuItem(
                                        value: items, child: Text(items));
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      dropdowndepartment = newValue!;
                                    });
                                  })))
                    ]),
                  ),
                  // class...
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(children: [
                      const Text('Class:',
                          style: TextStyle(color: Colors.white)),
                      Expanded(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('courses')
                                      .where('department',
                                          isEqualTo: dropdowndepartment)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    List<DropdownMenuItem> Class = [];
                                    if (!snapshot.hasData) {
                                      const CircularProgressIndicator();
                                    } else {
                                      final Classes =
                                          snapshot.data?.docs.reversed.toList();
                                      Class.add(const DropdownMenuItem(
                                          value: '0',
                                          child: Text('Select Class',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      153, 255, 255, 255)))));
                                      for (var users in Classes!) {
                                        Class.add(DropdownMenuItem(
                                            value: users.id,
                                            child: Text(users['cName'])));
                                      }
                                    }
                                    return DropdownButton(
                                      dropdownColor: Colors.teal[300],
                                      menuMaxHeight: 300,
                                      underline: Container(
                                        color: Colors.white,
                                        height: 1,
                                      ),
                                      iconEnabledColor: Colors.white,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 13),
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
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
                                  })))
                    ]),
                  ),

                  const Divider(),
                ],
              ),
            ),
          );
  }
}
