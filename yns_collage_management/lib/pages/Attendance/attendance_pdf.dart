// ignore_for_file: must_be_immutable, no_logic_in_create_state, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class AttendancePDF extends StatefulWidget {
  List list;
  List list2;
  String clas;
  String date;
  String subject;
  AttendancePDF(
      {required this.list,
      required this.list2,
      required this.clas,
      required this.date,
      required this.subject});
  @override
  State<AttendancePDF> createState() => _AttendancePDFState(
      list: list, list2: list2, clas: clas, date: date, subject: subject);
}

class _AttendancePDFState extends State<AttendancePDF> {
  List list;
  List list2;
  String clas;
  String date;
  String subject;

  _AttendancePDFState(
      {required this.list,
      required this.list2,
      required this.clas,
      required this.date,
      required this.subject});
  final pdf = pw.Document();
  var marks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        title: const Text('Attendance PDF'),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //     Navigator.pop(context);
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: PdfPreview(
        canChangeOrientation: false,
        canDebug: false,
        build: (format) => generateDocument(
          format,
        ),
      ),
    );
  }

  Future<Uint8List> generateDocument(PdfPageFormat format) async {
    final doc = pw.Document(pageMode: PdfPageMode.outlines);

    final font1 = await PdfGoogleFonts.openSansRegular();
    final font2 = await PdfGoogleFonts.openSansBold();

    doc.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(
          pageFormat: format.copyWith(
            marginBottom: 0,
            marginLeft: 0,
            marginRight: 0,
            marginTop: 0,
          ),
          orientation: pw.PageOrientation.portrait,
          theme: pw.ThemeData.withFont(
            base: font1,
            bold: font2,
          ),
        ),
        build: (context) {
          return pw.Column(
            // mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.SizedBox(
                height: 20,
              ),
              pw.Text(
                'Attendance sheet',
                style: const pw.TextStyle(
                  fontSize: 25,
                ),
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                children: [
                  pw.Row(children: [
                    pw.Text(
                      'Date: ',
                      style: const pw.TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    pw.Text(
                      date,
                      style: const pw.TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ]),
                  pw.Row(
                    children: [
                      pw.Text(
                        'Class : ',
                        style: const pw.TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      pw.Text(
                        clas,
                        style: const pw.TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //subject
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Subject : ',
                    style: const pw.TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  pw.Text(
                    subject,
                    style: const pw.TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Table(
                defaultColumnWidth: const pw.FixedColumnWidth(120.0),
                border: pw.TableBorder.all(
                  style: pw.BorderStyle.solid,
                  width: 2,
                ),
                children: [
                  pw.TableRow(children: [
                    pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Text(
                            'Roll-No.',
                            style: pw.TextStyle(
                              fontSize: 20.0,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ]),
                    pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Text(
                            'Name',
                            style: pw.TextStyle(
                              fontSize: 20.0,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ]),
                  ]),
                ],
              ),
              pw.ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) {
                  return pw.Table(
                    defaultColumnWidth: const pw.FixedColumnWidth(120.0),
                    border: pw.TableBorder.all(
                        style: pw.BorderStyle.solid, width: 2),
                    children: [
                      pw.TableRow(
                        children: [
                          pw.Column(
                            children: [
                              pw.Text(
                                list2[index],
                                textAlign: pw.TextAlign.center,
                                style: const pw.TextStyle(fontSize: 20.0),
                              ),
                            ],
                          ),
                          pw.Column(
                            children: [
                              pw.Text(
                                list[index],
                                textAlign: pw.TextAlign.center,
                                style: const pw.TextStyle(fontSize: 20.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );

    return doc.save();
  }
}
