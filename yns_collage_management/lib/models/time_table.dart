// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class TimeTable {
  final String description;
  final String title;
  final String Class;
  final String department;
  final String uid;
  final String name;
  final String timeTableId;
  final DateTime datePublished;
  final String timeTableUrl;
  final String photoUrl;
  final String docId;

  const TimeTable({
    required this.description,
    required this.title,
    required this.Class,
    required this.department,
    required this.uid,
    required this.name,
    required this.timeTableId,
    required this.datePublished,
    required this.timeTableUrl,
    required this.photoUrl,
    required this.docId,
  });

  static TimeTable fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return TimeTable(
      description: snapshot["description"],
      title: snapshot["title"],
      Class: snapshot["Class"],
      department: snapshot["department"],
      uid: snapshot["uid"],
      timeTableId: snapshot["timeTableId"],
      datePublished: snapshot["datePublished"],
      name: snapshot["name"],
      timeTableUrl: snapshot['timeTableUrl'],
      photoUrl: snapshot['photoUrl'],
      docId: snapshot['docId'],
    );
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "title": title,
        "Class": Class,
        "department": department,
        "uid": uid,
        "name": name,
        "timeTableId": timeTableId,
        "datePublished": datePublished,
        'timeTableUrl': timeTableUrl,
        'photoUrl': photoUrl,
        'docId': docId,
      };
}
