// ignore_for_file: must_be_immutable, unused_field, prefer_is_empty

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'dart:io';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/Utils/utils.dart';
import 'package:yns_college_management/Widgets/homework_card.dart';
import 'package:yns_college_management/pages/Home%20Work/add_home_work.dart';

class HomeWorkPage extends StatefulWidget {
  String uid;
  HomeWorkPage({required this.uid, super.key});
  @override
  State<HomeWorkPage> createState() => _HomeWorkPageState();
}

class _HomeWorkPageState extends State<HomeWorkPage> {
  final titleController = TextEditingController();
  // image picker
  File? _image;
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemorary = File(image.path);
    setState(() {
      _image = imageTemorary;
    });
  }

  //fetch user Data
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

  @override
  Widget build(BuildContext context) {
    var role = userData['role'];
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text('Home Work'),
            // actions: [
            //   Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //       child: IconButton(
            //           icon: const Icon(
            //             Icons.filter_alt,
            //           ),
            //           onPressed: () {}))
            // ],
            elevation: 0,
            backgroundColor: Colors.transparent),
        body: StreamBuilder(
          stream: (role != 'student')
              ? FirebaseFirestore.instance.collection('homeWork').snapshots()
              : FirebaseFirestore.instance
                  .collection('homeWork')
                  .where('Class', isEqualTo: userData['Class'])
                  .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              );
            }

            return (snapshot.data!.docs.length != 0)
                ? ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (ctx, index) => Container(
                        margin: const EdgeInsets.symmetric(),
                        child: HomeWorkCard(
                          uid: userData['uid'],
                          snap: snapshot.data!.docs[index].data(),
                        )),
                  )
                : Column(
                    children: [
                      SizedBox(
                        child: Lottie.asset('assets/images/img74.json'),
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        "HOME WORK NOT AVAILABLE*",
                        style: TextStyle(
                            color: Color.fromARGB(255, 5, 89, 145),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
            elevation: (userData['role'] != 'student') ? 5 : 0,
            backgroundColor: (userData['role'] != 'student')
                ? const Color.fromARGB(132, 91, 146, 141)
                : const Color.fromARGB(0, 255, 255, 255),
            onPressed: () {
              if (userData['role'] != 'student') {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: AddHomeWorkScreen(uid: userData['uid'])));
              }
            },
            label: (userData['role'] != 'student')
                ? Row(
                    children: const [
                      Text('Upload'),
                      Icon(
                        Icons.upload,
                        color: Colors.white,
                      )
                    ],
                  )
                : const Text('')));
  }
}
