// ignore_for_file: non_constant_identifier_names, deprecated_member_use
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({super.key});
  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  // Create Date-time Variable
  DateTime _dateTime = DateTime.now();
  DateTime _LeaveDate = DateTime.now();
  DateTime _LeaveDateFrom = DateTime.now();

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

  // Show Date Picker Method
  void _showDatePickerForLeave() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2030))
        .then((value) {
      setState(() {
        _LeaveDate = value!;
      });
    });
  }

  // Show Date Picker Method
  void _showDatePickerForLeaveFrom() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2030))
        .then((value) {
      setState(() {
        _LeaveDateFrom = value!;
      });
    });
  }

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

  // controller
  var resion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
        body: SingleChildScrollView(
            child: Column(children: [
          Center(
              child: Text(
            "Apply Leave",
            textAlign: TextAlign.center,
            style: TextStyle(shadows: [
              Shadow(
                  color: Colors.teal.shade900,
                  blurRadius: 5,
                  offset: const Offset(2, 2))
            ], fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          )),
          const SizedBox(height: 30),
          Center(
              child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(width: 1, color: Colors.teal.shade600),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.teal.shade600,
                                spreadRadius: 1)
                          ]),
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title
                                Center(
                                    child: Text('Add Details',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal[300]))),
                                //  Apply Date
                                Text('Apply Date:',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal[800])),
                                Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.teal.shade600)),
                                        child: InkWell(
                                            onTap: _showDatePicker,
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      // Display Date
                                                      Text(
                                                          '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                                                          style: const TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      0,
                                                                      105,
                                                                      92),
                                                              fontSize: 18)),
                                                      const Icon(
                                                          Icons.edit_calendar,
                                                          color: Color.fromARGB(
                                                              255, 0, 105, 92))
                                                    ]))))),
                                const SizedBox(height: 5),
                                // Leave Date
                                Text('Leave Date:',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal[800])),
                                Row(children: [
                                  Text('To: ',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal[400])),
                                  Expanded(
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors
                                                          .teal.shade600)),
                                              child: InkWell(
                                                  onTap:
                                                      _showDatePickerForLeave,
                                                  child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            // Display Date
                                                            Text(
                                                                '${_LeaveDate.day}/${_LeaveDate.month}/${_LeaveDate.year}',
                                                                style: const TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            0,
                                                                            105,
                                                                            92),
                                                                    fontSize:
                                                                        18)),
                                                            const Icon(
                                                                Icons
                                                                    .edit_calendar,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        105,
                                                                        92))
                                                          ]))))))
                                ]),
                                Row(children: [
                                  Text('From: ',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal[400])),
                                  Expanded(
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors
                                                          .teal.shade600)),
                                              child: InkWell(
                                                  onTap:
                                                      _showDatePickerForLeaveFrom,
                                                  child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            // Display Date
                                                            Text(
                                                                '${_LeaveDateFrom.day}/${_LeaveDateFrom.month}/${_LeaveDateFrom.year}',
                                                                style: const TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            0,
                                                                            105,
                                                                            92),
                                                                    fontSize:
                                                                        18)),
                                                            const Icon(
                                                                Icons
                                                                    .edit_calendar,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        105,
                                                                        92))
                                                          ]))))))
                                ]),
                                const SizedBox(height: 5),
                                // Resion
                                Text('Resion:',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal[800])),
                                Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: SizedBox(
                                        height: 155,
                                        child: TextField(
                                            controller: resion,
                                            style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16),
                                            maxLength: 1000,
                                            maxLines: 4,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)))))),
                                // Attach Document
                                Text('Attach Document:',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal[800])),
                                Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: InkWell(
                                            onTap: (() {
                                              getImage();
                                            }),
                                            child: Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors
                                                            .teal.shade600)),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      _image != null
                                                          ? Image.file(_image!,
                                                              height: 50,
                                                              width: 50)
                                                          : const Icon(
                                                              Icons
                                                                  .cloud_upload_sharp,
                                                              size: 35),
                                                      const SizedBox(width: 5),
                                                      const Text(
                                                          'Upload Document')
                                                    ]))))),
                                // Submit Button
                                Center(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          String msg = resion.text.toString();
                                          launch(
                                              'mailto: ykg1357@gmail.com?subject=Apply Leave&body=Apply Date \n$_dateTime\n\n To \n$_LeaveDate\n\n From \n$_LeaveDateFrom\n\n $msg ');
                                        },
                                        style: TextButton.styleFrom(
                                            minimumSize: const Size(120, 40)),
                                        child: const Text("Submit")))
                              ])))))
        ])));
  }
}
