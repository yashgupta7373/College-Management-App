// ignore_for_file: sort_child_properties_last, camel_case_types, must_be_immutable, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';

class feePage extends StatelessWidget {
  const feePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        body: SingleChildScrollView(
            child: Column(children: [
          // title
          Center(
              child: Text("Fee Structure\n[2023]",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Colors.teal.shade900,
                            blurRadius: 5,
                            offset: const Offset(2, 2))
                      ],
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
          // Bca
          feePageWidget(
              courseName: 'Bachelor of Computer Applications [BCA]',
              duration: '3 Year',
              place: 'on campus',
              type: 'Degree',
              time: 'Full Time',
              courseType: 'Graduation',
              eligibility: '12th Pass with min. 60%',
              nameAndYear1: 'BCA 1st Year',
              fees1: '30800',
              nameAndYear2: 'BCA 2nd Year',
              fees2: '29800',
              nameAndYear3: 'BCA 3rd Year',
              fees3: '28800'),
          // mca...
          feePageWidget(
              courseName: 'Master of Computer Applications [MCA]',
              duration: '2 Year',
              place: 'on campus',
              type: 'Degree',
              time: 'Full Time',
              courseType: 'Post Graduation',
              eligibility: 'Graduation Pass with min. 60%',
              nameAndYear1: 'MCA 1st Year',
              fees1: '60000',
              nameAndYear2: 'MCA 2nd Year',
              fees2: '59000'),

          // Bsc
          feePageWidget(
              courseName: 'Bachelor of Science in CS [B.Sc]',
              duration: '3 Year',
              place: 'on campus',
              type: 'Degree',
              time: 'Full Time',
              courseType: 'Graduation',
              eligibility: '12th with min. 60%',
              nameAndYear1: 'B.Sc 1st Year',
              fees1: '30800',
              nameAndYear2: 'B.Sc 2nd Year',
              fees2: '29800',
              nameAndYear3: 'B.Sc 3rd Year',
              fees3: '28800'),
          // Msc
          feePageWidget(
              courseName: 'Master of Science in CS [M.Sc]',
              duration: '2 Year',
              place: 'on campus',
              type: 'Degree',
              time: 'Full Time',
              courseType: 'Post Graduation',
              eligibility: 'Graduation with min. 60%',
              nameAndYear1: 'M.Sc 1st Year',
              fees1: '50800',
              nameAndYear2: 'M.Sc 2nd Year',
              fees2: '49800'),

          // BBA
          feePageWidget(
              courseName: 'Bachelor of Business Administration [BBA]',
              duration: '3 Year',
              place: 'on campus',
              type: 'Degree',
              time: 'Full Time',
              courseType: 'Graduation',
              eligibility: '12th with min. 60%',
              nameAndYear1: 'BBA 1st Year',
              fees1: '30800',
              nameAndYear2: 'BBA 2nd Year',
              fees2: '29800',
              nameAndYear3: 'BBA 3rd Year',
              fees3: '28800'),
          // MBA
          feePageWidget(
              courseName: 'Master of Business Administration [MBA]',
              duration: '2 Year',
              place: 'on campus',
              type: 'Degree',
              time: 'Full Time',
              courseType: 'Post Graduation',
              eligibility: 'Graduation with min. 60%',
              nameAndYear1: 'MBA 1st Year',
              fees1: '60800',
              nameAndYear2: 'MBA 2nd Year',
              fees2: '59800'),

          // BCom
          feePageWidget(
              courseName: 'Bachelor of Commerce [BCom]',
              duration: '3 Year',
              place: 'on campus',
              type: 'Degree',
              time: 'Full Time',
              courseType: 'Graduation',
              eligibility: '12th with min. 60%',
              nameAndYear1: 'BCom 1st Year',
              fees1: '30800',
              nameAndYear2: 'BCom 2nd Year',
              fees2: '29800',
              nameAndYear3: 'BCom 3rd Year',
              fees3: '28800'),
          // MCom
          feePageWidget(
              courseName: 'Master  of Commerce [MCom]',
              duration: '2 Year',
              place: 'on campus',
              type: 'Degree',
              time: 'Full Time',
              courseType: 'Post Graduation',
              eligibility: 'Graduation with min. 60%',
              nameAndYear1: 'MCom 1st Year',
              fees1: '50800',
              nameAndYear2: 'MCom 2nd Year',
              fees2: '49800')
        ])));
  }
}

// widget for fees Structure
class feePageWidget extends StatelessWidget {
  String courseName, type, time, courseType, duration, place, eligibility;
  final nameAndYear1,
      nameAndYear2,
      nameAndYear3,
      nameAndYear4,
      nameAndYear5,
      fees1,
      fees2,
      fees3,
      fees4,
      fees5;
  feePageWidget(
      {required this.courseName,
      required this.duration,
      required this.place,
      required this.type,
      required this.time,
      required this.courseType,
      required this.eligibility,
      this.nameAndYear1,
      this.nameAndYear2,
      this.nameAndYear3,
      this.nameAndYear4,
      this.nameAndYear5,
      this.fees1,
      this.fees2,
      this.fees3,
      this.fees4,
      this.fees5,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
            width: double.infinity,
            child: Column(children: [
              Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(courseName,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)))),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.schedule, color: Colors.red),
                    Icon(Icons.menu_book, color: Colors.red),
                    Icon(Icons.account_balance, color: Colors.red),
                    Icon(Icons.local_library, color: Colors.red),
                    Icon(Icons.hourglass_full, color: Colors.red)
                  ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text(duration,
                    style: const TextStyle(fontSize: 12, color: Colors.red)),
                Text(type,
                    style: const TextStyle(fontSize: 12, color: Colors.red)),
                Text(place,
                    style: const TextStyle(fontSize: 12, color: Colors.red)),
                Text(courseType,
                    style: const TextStyle(fontSize: 12, color: Colors.red)),
                Text(time,
                    style: const TextStyle(fontSize: 12, color: Colors.red))
              ]),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Eligibility - $eligibility",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]))),
              Text("Fee Structure:-",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[200])),
              if (nameAndYear1 != null || fees1 != null)
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("$nameAndYear1     -     $fees1",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[100])),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text("PAY NOW"),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0))))
                    ]),
              if (nameAndYear2 != null || fees2 != null)
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("$nameAndYear2     -     $fees2",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[100])),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text("PAY NOW"),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0))))
                    ]),
              if (nameAndYear3 != null || fees3 != null)
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("$nameAndYear3     -     $fees3",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[100])),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text("PAY NOW"),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0))))
                    ]),
              if (nameAndYear4 != null || fees4 != null)
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("$nameAndYear4     -     $fees4",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[100])),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text("PAY NOW"),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0))))
                    ]),
              if (nameAndYear5 != null || fees5 != null)
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("$nameAndYear5     -     $fees5",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[100])),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text("PAY NOW"),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0))))
                    ])
            ]),
            decoration: BoxDecoration(
                color: Colors.teal[800],
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 1, color: Colors.teal.shade800),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.teal.shade900,
                      spreadRadius: 1)
                ])));
  }
}
