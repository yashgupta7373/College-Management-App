// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Result {
  final String description;
  final String title;
  final String Class;
  final String department;
  final String uid;
  final String name;
  final String resultId;
  final DateTime datePublished;
  final String resultUrl;
  final String photoUrl;
  final String id;

  const Result({
    required this.description,
    required this.title,
    required this.Class,
    required this.department,
    required this.uid,
    required this.name,
    required this.resultId,
    required this.datePublished,
    required this.resultUrl,
    required this.photoUrl,
    required this.id,
  });

  static Result fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Result(
        description: snapshot["description"],
        title: snapshot["title"],
        Class: snapshot["Class"],
        department: snapshot["department"],
        uid: snapshot["uid"],
        resultId: snapshot["resultId"],
        datePublished: snapshot["datePublished"],
        name: snapshot["name"],
        resultUrl: snapshot['resultUrl'],
        photoUrl: snapshot['photoUrl'],
        id: snapshot['id']);
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "title": title,
        "Class": Class,
        "department": department,
        "uid": uid,
        "name": name,
        "resultId": resultId,
        "datePublished": datePublished,
        'resultUrl': resultUrl,
        'photoUrl': photoUrl,
        'id': id
      };
}
