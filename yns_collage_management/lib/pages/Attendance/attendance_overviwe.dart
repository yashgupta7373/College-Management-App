// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'attendance_pdf.dart';

class AttendanceOverViwe extends StatefulWidget {
  int totalStudent, totalPresent, totalAbsent;
  var date, Class, subject;
  List list, list2;
  AttendanceOverViwe(
      {required this.totalStudent,
      required this.totalPresent,
      required this.totalAbsent,
      required this.date,
      required this.Class,
      required this.subject,
      required this.list,
      required this.list2,
      super.key});
  @override
  State<AttendanceOverViwe> createState() =>
      _AttendanceOverViweState(list: list, list2: list2);
}

class _AttendanceOverViweState extends State<AttendanceOverViwe> {
  List list;
  List list2;
  _AttendanceOverViweState({
    required this.list,
    required this.list2,
  });

  final colorList = <Color>[
    const Color.fromARGB(255, 47, 255, 0),
    const Color.fromARGB(255, 255, 0, 0)
  ];

  @override
  Widget build(BuildContext context) {
    int ts = widget.totalStudent;
    int tp = widget.totalPresent;
    int ta = widget.totalAbsent;
    Map<String, double> dataMap = {
      "Present": tp.toDouble(),
      "Absent": ta.toDouble(),
    };

    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(height: 50),
          Center(
              child: Text('Total Students In class',
                  style: TextStyle(
                      color: Colors.teal[900],
                      fontSize: 22,
                      fontWeight: FontWeight.bold))),
          Center(
              child: Text('$ts',
                  style: TextStyle(color: Colors.teal[900], fontSize: 22))),
          const SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text('Total Present',
                    style: TextStyle(
                        color: Color.fromARGB(255, 21, 255, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text('Total Absent',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))
              ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text('$tp',
                style: const TextStyle(
                    color: Color.fromARGB(255, 21, 255, 0), fontSize: 20)),
            Text('$ta', style: const TextStyle(color: Colors.red, fontSize: 20))
          ]),
          const SizedBox(height: 50),
          Center(
              child: PieChart(
                  colorList: colorList,
                  dataMap: dataMap,
                  animationDuration: const Duration(seconds: 2),
                  chartLegendSpacing: 50,
                  chartRadius: MediaQuery.of(context).size.width * 0.5,
                  initialAngleInDegree: 0,
                  chartType: ChartType.ring,
                  centerTextStyle: TextStyle(
                      color: Colors.teal[900],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  ringStrokeWidth: 60,
                  centerText: "Over View",
                  legendOptions: const LegendOptions(
                      showLegendsInRow: false,
                      legendPosition: LegendPosition.bottom,
                      showLegends: true,
                      legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white)),
                  chartValuesOptions: const ChartValuesOptions(
                      chartValueStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 77, 64),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      showChartValueBackground: true,
                      showChartValues: true,
                      showChartValuesInPercentage: true,
                      showChartValuesOutside: true,
                      decimalPlaces: 0))),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                // Save Attendance...
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AttendancePDF(
                        list: list,
                        list2: list2,
                        clas: widget.Class,
                        date: widget.date,
                        subject: widget.subject),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[700],
                  elevation: 20,
                  shadowColor: Colors.teal[900],
                  side: BorderSide(
                      color: Colors.teal.shade700,
                      width: 2,
                      style: BorderStyle.solid),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  minimumSize: const Size(150, 60)),
              child: const Text('Create PDF'))
        ])));
  }
}
