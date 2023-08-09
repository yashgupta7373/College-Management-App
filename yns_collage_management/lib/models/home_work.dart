// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeWork {
  final String description;
  final String title;
  final String Class;
  final String subject;
  final String department;
  final String uid;
  final String name;
  final String homeWorkId;
  final DateTime datePublished;
  final String homeWorkUrl;
  final String photoUrl;

  const HomeWork({
    required this.description,
    required this.title,
    required this.Class,
    required this.subject,
    required this.department,
    required this.uid,
    required this.name,
    required this.homeWorkId,
    required this.datePublished,
    required this.homeWorkUrl,
    required this.photoUrl,
  });

  static HomeWork fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return HomeWork(
        description: snapshot["description"],
        title: snapshot["title"],
        Class: snapshot["Class"],
        subject: snapshot["subject"],
        department: snapshot["department"],
        uid: snapshot["uid"],
        homeWorkId: snapshot["homeWorkId"],
        datePublished: snapshot["datePublished"],
        name: snapshot["name"],
        homeWorkUrl: snapshot['homeWorkUrl'],
        photoUrl: snapshot['photoUrl']);
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "title": title,
        "Class": Class,
        "subject": subject,
        "department": department,
        "uid": uid,
        "name": name,
        "homeWorkId": homeWorkId,
        "datePublished": datePublished,
        'homeWorkUrl': homeWorkUrl,
        'photoUrl': photoUrl
      };
}
