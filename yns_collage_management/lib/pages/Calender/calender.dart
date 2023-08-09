// ignore_for_file: depend_on_referenced_packages, avoid_print, must_be_immutable
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  String role;
  Calendar({required this.role, super.key});
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
  Map<String, List> mySelectedEvents = {};
  final titleController = TextEditingController();
  final descpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;
    loadPreviousEvents();
  }

  loadPreviousEvents() {
    mySelectedEvents = {
      "2022-09-13": [
        {"eventDescp": "11", "eventTitle": "111"},
        {"eventDescp": "22", "eventTitle": "22"}
      ],
      "2022-09-30": [
        {"eventDescp": "22", "eventTitle": "22"}
      ],
      "2022-09-20": [
        {"eventTitle": "ss", "eventDescp": "ss"}
      ]
    };
  }

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  _showAddEventDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: const Text('Add New Event', textAlign: TextAlign.center),
                content: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                          controller: titleController,
                          textCapitalization: TextCapitalization.words,
                          decoration:
                              const InputDecoration(labelText: 'Title')),
                      TextField(
                          controller: descpController,
                          textCapitalization: TextCapitalization.words,
                          decoration:
                              const InputDecoration(labelText: 'Description'))
                    ]),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                      child: const Text('Add Event'),
                      onPressed: () {
                        if (titleController.text.isEmpty &&
                            descpController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Required title and description'),
                                  duration: Duration(seconds: 2)));
                          return;
                        } else {
                          print(titleController.text);
                          print(descpController.text);
                          setState(() {
                            if (mySelectedEvents[DateFormat('yyyy-MM-dd')
                                    .format(_selectedDate!)] !=
                                null) {
                              mySelectedEvents[DateFormat('yyyy-MM-dd')
                                      .format(_selectedDate!)]
                                  ?.add({
                                "eventTitle": titleController.text,
                                "eventDescp": descpController.text
                              });
                            } else {
                              mySelectedEvents[DateFormat('yyyy-MM-dd')
                                  .format(_selectedDate!)] = [
                                {"eventTitle": titleController.text}
                              ];
                            }
                          });
                          print(
                              "New Event for backend developer ${json.encode(mySelectedEvents)}");
                          titleController.clear();
                          descpController.clear();
                          Navigator.pop(context);
                          return;
                        }
                      })
                ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
          Text("Calendar",
              style: TextStyle(
                  shadows: [
                    Shadow(
                        color: Colors.teal.shade900,
                        blurRadius: 5,
                        offset: const Offset(2, 2))
                  ],
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 15),
          TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime(2000),
              lastDay: DateTime(2030),
              calendarFormat: _calendarFormat,
              onDaySelected: ((selectedDay, focusedDay) {
                if (!isSameDay(_selectedDate, selectedDay)) {
                  //
                  setState(() {
                    _selectedDate = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              }),
              selectedDayPredicate: ((day) {
                return isSameDay(_selectedDate, day);
              }),
              // formate
              onFormatChanged: ((format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              }),
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              eventLoader: _listOfDayEvents),
          ..._listOfDayEvents(_selectedDate!).map((myEvents) => ListTile(
              leading: const Icon(Icons.done, color: Colors.teal),
              title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Event Title:   ${myEvents['eventTitle']}')),
              subtitle: Text('Description:   ${myEvents['eventDescp']}')))
        ]))),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              if (widget.role != 'Students') {
                _showAddEventDialog();
              }
            },
            label: const Text('Add Event')));
  }
}
