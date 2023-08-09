// ignore_for_file: deprecated_member_use, must_be_immutable, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/pages/Attendance/attendance_form.dart';
import 'package:yns_college_management/pages/Library/issue_book.dart';
import '../pages/Apply Leave/apply_leave.dart';
import '../pages/Calender/calender.dart';
import '../pages/Check Attendance/check_attendance.dart';
import '../pages/Home Work/home_work.dart';
import '../pages/Id Card/id_card.dart';
import '../pages/Library/library_old_record.dart';
import '../pages/Library/return_book.dart';
import '../pages/Notice Board/notice_board.dart';
import '../pages/Result/result.dart';
import '../pages/Time Table/time_table.dart';
import '../pages/Transport/transport.dart';

// Container Widget....
class ContainerWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback ontap;
  const ContainerWidget(
      {Key? key, required this.text, required this.icon, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
            height: mediaQuery.size.width * 0.35,
            width: mediaQuery.size.width * 0.35,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.teal.shade100,
                  Colors.teal.shade300,
                  Colors.teal.shade500,
                ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                borderRadius: const BorderRadius.all(Radius.circular(40))),
            child: ElevatedButton(
                onPressed: ontap,
                style: ElevatedButton.styleFrom(
                    elevation: 20,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.teal[800],
                    side: BorderSide(
                        color: Colors.teal.shade500,
                        width: 2,
                        style: BorderStyle.solid),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0)),
                    minimumSize: const Size(200, 160)),
                child: FittedBox(
                    child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(icon,
                                  color: Colors.white,
                                  size: 300,
                                  shadows: <Shadow>[
                                    Shadow(
                                        color: Colors.teal.shade800,
                                        blurRadius: 6.0,
                                        offset: const Offset(2, 2))
                                  ]),
                              Text(text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(shadows: [
                                    Shadow(
                                        color: Colors.teal.shade900,
                                        blurRadius: 5,
                                        offset: const Offset(2, 2))
                                  ], fontSize: 80, fontWeight: FontWeight.bold))
                            ]))))));
  }
}

// AttendanceTaker for Admin, Teachers Home Page
class AttendanceTakerBtn extends StatelessWidget {
  var name;
  AttendanceTakerBtn({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        text: 'Attendance\nTaker',
        icon: Icons.edit_calendar,
        ontap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: AttendanceForm(name: name)));
        });
  }
}

// AttendanceTaker for Admin, Teachers and student Home Page
class CheckAttendanceBtn extends StatelessWidget {
  const CheckAttendanceBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        text: 'Check\nAttendance',
        icon: FontAwesomeIcons.calendarCheck,
        ontap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: const CheckAttendance()));
        });
  }
}

// Library for Admin, Teachers and student Home Page
class LibraryBtn extends StatelessWidget {
  String uid, role;
  LibraryBtn({required this.uid, required this.role, super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        text: 'Library    ',
        icon: Icons.local_library,
        ontap: () {
          // (role != 'student')
          //     ?
          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  backgroundColor: const Color.fromRGBO(100, 232, 222, 0.7),
                  content: SizedBox(
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                        if (role != 'student')
                          TextStyleWidget(
                              text: 'Issue Book',
                              ontap: (() {
                                Navigator.of(ctx).pop();
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: IssueBook(uid: uid)));
                              }),
                              icon: FontAwesomeIcons.book),
                        TextStyleWidget(
                            text: 'Return Book',
                            ontap: (() {
                              Navigator.of(ctx).pop();
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: ReturnBook(uid: uid)));
                            }),
                            icon: FontAwesomeIcons.book),
                        TextStyleWidget(
                            text: 'Old Record',
                            ontap: (() {
                              Navigator.of(ctx).pop();
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: LibraryOldRecord(uid: uid)));
                            }),
                            icon: FontAwesomeIcons.book),
                      ])))));
          // :
          // // Navigator.push(
          // //     context,
          // //     PageTransition(
          // //         type: PageTransitionType.fade,
          // //         child: ReturnBook(uid: uid)));
        });
  }
}

// Calendar for Admin, Teachers and student Home Page
class CalendarBtn extends StatelessWidget {
  String role;
  CalendarBtn({required this.role, super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        text: 'Calendar',
        icon: FontAwesomeIcons.calendar,
        ontap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: Calendar(role: role)));
        });
  }
}

// TimeTable for Admin, Teachers and student Home Page
class TimeTableBtn extends StatelessWidget {
  String uid;
  TimeTableBtn({required this.uid, super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        text: 'Time Table',
        icon: FontAwesomeIcons.clock,
        ontap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: TimeTablePage(uid: uid)));
        });
  }
}

// Result for Admin, Teachers and student Home Page
class ResultBtn extends StatelessWidget {
  String uid;
  ResultBtn({required this.uid, super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        text: 'Result        ',
        icon: FontAwesomeIcons.chartLine,
        ontap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: ResultPage(uid: uid)));
        });
  }
}

// Transport for Admin, Teachers and student Home Page
class TransportBtn extends StatelessWidget {
  String uid;
  TransportBtn({required this.uid, super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        text: 'Transport',
        icon: FontAwesomeIcons.bus,
        ontap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: Transport(uid: uid)));
        });
  }
}

// NoticeBoard for Admin, Teachers and student Home Page
class NoticeBoardBtn extends StatelessWidget {
  String uid;
  NoticeBoardBtn({required this.uid, super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        text: 'Notice\nBoard',
        icon: FontAwesomeIcons.volumeHigh,
        ontap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: NoticeBoard(
                    uid: uid,
                  )));
        });
  }
}

// IdCard for Admin, Teachers and student Home Page
class IdCardBtn extends StatelessWidget {
  String uid;
  IdCardBtn({required this.uid, super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        text: 'ID Card',
        icon: FontAwesomeIcons.idCard,
        ontap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: IdCard(uid: uid)));
        });
  }
}

// HomeWork for Admin, Teachers and student Home Page
class HomeWorkBtn extends StatelessWidget {
  String uid;
  HomeWorkBtn({required this.uid, super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        text: 'Home\nWork',
        icon: FontAwesomeIcons.pen,
        ontap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: HomeWorkPage(uid: uid)));
        });
  }
}

// ApplyLeave for Admin, Teachers and student Home Page
class ApplyLeaveBtn extends StatelessWidget {
  const ApplyLeaveBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        text: 'Apply\nLeave',
        icon: FontAwesomeIcons.personWalking,
        ontap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: const ApplyLeave()));
        });
  }
}

//Text Style For Admin Settings
class TextStyleWidget extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final IconData icon;
  const TextStyleWidget(
      {Key? key, required this.text, required this.ontap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon, size: 18, color: Colors.teal[900]),
      TextButton(
          onPressed: ontap,
          child: Text(text,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.teal[900],
                  fontStyle: FontStyle.normal)))
    ]);
  }
}
