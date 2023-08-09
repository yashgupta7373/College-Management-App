// ignore_for_file: deprecated_member_use, non_constant_identifier_names, must_be_immutable, prefer_const_constructors_in_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/pages/Admin/Admin%20Settings/add_student_page.dart';
import 'package:yns_college_management/pages/Admin/Admin%20Settings/add_time_table.dart';
import 'package:yns_college_management/pages/College%20Web/my_drawer_header.dart';
import 'package:yns_college_management/pages/search_page.dart';
import '../../Widgets/call_class_room_and_online_class.dart';
import '../../Widgets/home_page_widget.dart';
import '../Utils/utils.dart';
import 'Admin/Admin Settings/add_courses_page.dart';
import 'Admin/Admin Settings/add_result.dart';
import 'Admin/Admin Settings/add_teachers_or_admin_page.dart';
import 'Admin/Admin Settings/edit.dart';
import 'Admin/Admin Settings/edit_courses.dart';
import 'Admin/Admin Settings/edit_page_form.dart';

class HomePage extends StatefulWidget {
  final String uid;
  HomePage({super.key, required this.uid});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            extendBody: true,
            backgroundColor: const Color.fromRGBO(100, 232, 222, 1.0),
            appBar: AppBar(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(userData['name']),
                      Row(children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      child: const SearchScreen()));
                            },
                            child: const Icon(FontAwesomeIcons.search,
                                color: Colors.white)),
                        const SizedBox(width: 10),
                        const CallClasses(),
                        const SizedBox(width: 20),
                        InkWell(
                            onTap: () async {
                              await LaunchApp.openApp(
                                  androidPackageName: 'com.whatsapp',
                                  iosUrlScheme:
                                      'https://www.apple.com/us/search/whatsapp?src=globalnav',
                                  openStore: true);
                            },
                            child: const Icon(
                                FontAwesomeIcons.facebookMessenger,
                                color: Colors.white))
                      ])
                    ]),
                backgroundColor: Colors.transparent,
                elevation: 0),
            body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromRGBO(165, 90, 255, 1.0),
                  Color.fromRGBO(138, 100, 235, 1.0),
                  Color.fromRGBO(100, 232, 222, 1.0),
                ], begin: Alignment.bottomLeft, end: Alignment.centerRight)),
                child: Column(children: [
                  // Name Card...
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          height: 180,
                          // width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(100, 232, 222, 1.0),
                                    Color.fromRGBO(138, 120, 235, 1.0)
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.centerRight),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(5, 10),
                                    blurRadius: 20,
                                    color:
                                        Colors.teal.shade900.withOpacity(0.2))
                              ],
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(80))),
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: InkWell(
                                                  onTap: () =>
                                                      Navigator.of(ctx).pop(),
                                                  child: Image.network(
                                                      userData['photoUrl']),
                                                )));
                                      },
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 50,
                                          backgroundImage: NetworkImage(
                                            userData['photoUrl'],
                                          )),
                                    ),
                                    Expanded(
                                        child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: FittedBox(
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                  RichText(
                                                      softWrap: true,
                                                      text: (userData['role'] ==
                                                                  'admin' ||
                                                              userData[
                                                                      'role'] ==
                                                                  'teacher')
                                                          ? TextSpan(
                                                              text: userData[
                                                                  'name'],
                                                              style: const TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: [
                                                                  const TextSpan(
                                                                      text:
                                                                          '\n'),
                                                                  TextSpan(
                                                                      text: userData[
                                                                          'id'],
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              15)),
                                                                  const TextSpan(
                                                                      text:
                                                                          '\n'),
                                                                  TextSpan(
                                                                      text: userData[
                                                                          'profile'],
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              15)),
                                                                  const TextSpan(
                                                                      text:
                                                                          '\n'),
                                                                  TextSpan(
                                                                      text: userData[
                                                                          'department'],
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              15)),
                                                                ])
                                                          : TextSpan(
                                                              text: userData[
                                                                  'name'],
                                                              style: const TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: [
                                                                  const TextSpan(
                                                                      text:
                                                                          '\n'),
                                                                  TextSpan(
                                                                      text: userData[
                                                                          'id'],
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              15)),
                                                                  const TextSpan(
                                                                      text:
                                                                          '\n'),
                                                                  TextSpan(
                                                                      text: userData[
                                                                          'Class'],
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              15)),
                                                                  const TextSpan(
                                                                      text:
                                                                          '\n'),
                                                                  TextSpan(
                                                                      text: userData[
                                                                          'department'],
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              15))
                                                                ]))
                                                ]))))
                                  ])))),
                  Expanded(
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.teal.shade700.withOpacity(0.1),
                                    Colors.teal.shade500.withOpacity(0.5)
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.centerRight)),
                          // for Admin & teacher...
                          child:
                              (userData['role'] == 'admin' ||
                                      userData['role'] == 'teacher')
                                  ? GridView.count(
                                      crossAxisCount: 2,
                                      children: [
                                          AttendanceTakerBtn(
                                              name: userData['name']),
                                          const CheckAttendanceBtn(),
                                          LibraryBtn(
                                              uid: userData['uid'],
                                              role: userData['role']),
                                          CalendarBtn(role: 'student'),
                                          TimeTableBtn(uid: userData['uid']),
                                          ResultBtn(uid: userData['uid']),
                                          TransportBtn(uid: userData['uid']),
                                          NoticeBoardBtn(uid: userData['uid']),
                                          IdCardBtn(uid: userData['uid']),
                                          HomeWorkBtn(uid: userData['uid']),
                                          const ApplyLeaveBtn(),
                                          if (userData['role'] == 'admin')
                                            // Admin Settings
                                            ContainerWidget(
                                                text: 'Admin\nSettings',
                                                icon: Icons.settings,
                                                ontap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (ctx) =>
                                                          AlertDialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          30.0)),
                                                              backgroundColor:
                                                                  const Color
                                                                          .fromRGBO(
                                                                      100,
                                                                      232,
                                                                      222,
                                                                      0.7),
                                                              content: SizedBox(
                                                                  child:
                                                                      SingleChildScrollView(
                                                                          child: Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                    TextStyleWidget(
                                                                        text:
                                                                            'Add Student',
                                                                        ontap:
                                                                            (() {
                                                                          Navigator.push(
                                                                              context,
                                                                              PageTransition(type: PageTransitionType.fade, child: const SRegistrationPage()));
                                                                        }),
                                                                        icon: FontAwesomeIcons
                                                                            .userPlus),
                                                                    TextStyleWidget(
                                                                        text:
                                                                            'Add Teacher Or Admin',
                                                                        ontap:
                                                                            (() {
                                                                          Navigator.push(
                                                                              context,
                                                                              PageTransition(type: PageTransitionType.fade, child: const TRegistrationPage()));
                                                                        }),
                                                                        icon: FontAwesomeIcons
                                                                            .userPlus),
                                                                    TextStyleWidget(
                                                                        text:
                                                                            'Edit Student',
                                                                        ontap:
                                                                            (() {
                                                                          Navigator.push(
                                                                              context,
                                                                              PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  child: EditFormPage(
                                                                                    role: 'student',
                                                                                  )));
                                                                        }),
                                                                        icon: FontAwesomeIcons
                                                                            .userPen),
                                                                    TextStyleWidget(
                                                                        text:
                                                                            'Edit Teacher',
                                                                        ontap:
                                                                            (() {
                                                                          Navigator.push(
                                                                              context,
                                                                              PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  child: EditFormPage(
                                                                                    role: 'teacher',
                                                                                  )));
                                                                        }),
                                                                        icon: FontAwesomeIcons
                                                                            .userPen),
                                                                    TextStyleWidget(
                                                                        text:
                                                                            'Edit Admin',
                                                                        ontap:
                                                                            (() {
                                                                          Navigator.push(
                                                                              context,
                                                                              PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  child: EditFormPage(
                                                                                    role: 'admin',
                                                                                  )));
                                                                        }),
                                                                        icon: FontAwesomeIcons
                                                                            .userXmark),
                                                                    TextStyleWidget(
                                                                        text:
                                                                            'Add Courses',
                                                                        ontap:
                                                                            (() {
                                                                          Navigator.push(
                                                                              context,
                                                                              PageTransition(type: PageTransitionType.fade, child: AddCoursesPage(uid: userData['uid'])));
                                                                        }),
                                                                        icon: FontAwesomeIcons
                                                                            .bookMedical),
                                                                    TextStyleWidget(
                                                                        text:
                                                                            'Edit Courses',
                                                                        ontap:
                                                                            (() {
                                                                          Navigator.push(
                                                                              context,
                                                                              PageTransition(type: PageTransitionType.fade, child: EditCourse()));
                                                                        }),
                                                                        icon: FontAwesomeIcons
                                                                            .trash),
                                                                    TextStyleWidget(
                                                                        text:
                                                                            'Add Time Table',
                                                                        ontap:
                                                                            (() {
                                                                          Navigator.push(
                                                                              context,
                                                                              PageTransition(type: PageTransitionType.fade, child: AddTimeTableScreen(uid: userData['uid'])));
                                                                        }),
                                                                        icon: FontAwesomeIcons
                                                                            .calendarPlus),
                                                                    TextStyleWidget(
                                                                        text:
                                                                            'Add Marks',
                                                                        ontap:
                                                                            (() {
                                                                          Navigator.push(
                                                                              context,
                                                                              PageTransition(type: PageTransitionType.fade, child: AddResultScreen(uid: userData['uid'])));
                                                                        }),
                                                                        icon: FontAwesomeIcons
                                                                            .marker),
                                                                  ])))));
                                                })
                                        ])
                                  // for Student...
                                  : GridView.count(
                                      crossAxisCount: 2,
                                      children: [
                                          const CheckAttendanceBtn(),
                                          LibraryBtn(
                                              uid: userData['uid'],
                                              role: 'student'),
                                          CalendarBtn(role: userData['role']),
                                          TimeTableBtn(uid: userData['uid']),
                                          ResultBtn(uid: userData['uid']),
                                          TransportBtn(uid: userData['uid']),
                                          NoticeBoardBtn(uid: userData['uid']),
                                          IdCardBtn(uid: userData['uid']),
                                          HomeWorkBtn(uid: userData['uid']),
                                          const ApplyLeaveBtn()
                                        ])))
                ])),
            // App Drawer
            drawer: Drawer(
                child: SingleChildScrollView(
                    child: Column(
                        children: const [MyHeaderDrawer(), MyDrawerlist()]))));
  }
}
