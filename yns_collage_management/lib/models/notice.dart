// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Notice {
  final String description;
  final String title;
  final String Class;
  final String department;
  final String uid;
  final String name;
  final String noticeId;
  final DateTime datePublished;
  final String noticeUrl;
  final String photoUrl;
  final String docId;

  const Notice({
    required this.description,
    required this.title,
    required this.Class,
    required this.department,
    required this.uid,
    required this.name,
    required this.noticeId,
    required this.datePublished,
    required this.noticeUrl,
    required this.photoUrl,
    required this.docId,
  });

  static Notice fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Notice(
        description: snapshot["description"],
        title: snapshot["title"],
        Class: snapshot["Class"],
        department: snapshot["department"],
        uid: snapshot["uid"],
        noticeId: snapshot["noticeId"],
        datePublished: snapshot["datePublished"],
        name: snapshot["name"],
        noticeUrl: snapshot['noticeUrl'],
        photoUrl: snapshot['photoUrl'],
        docId: snapshot['docId']);
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "title": title,
        "Class": Class,
        "department": department,
        "uid": uid,
        "name": name,
        "noticeId": noticeId,
        "datePublished": datePublished,
        'noticeUrl': noticeUrl,
        'photoUrl': photoUrl,
        'docId': docId,
      };
}
