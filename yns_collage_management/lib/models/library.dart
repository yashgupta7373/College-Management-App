// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Detail {
  final String name;
  final String id;
  final String photoUrl;
  final String Class;
  final String book;
  final String uid;
  final String issueDate;
  final String docId;

  const Detail({
    required this.name,
    required this.id,
    required this.photoUrl,
    required this.Class,
    required this.book,
    required this.uid,
    required this.issueDate,
    required this.docId,
  });

  static Detail fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Detail(
      name: snapshot["name"],
      id: snapshot["id"],
      photoUrl: snapshot["photoUrl"],
      book: snapshot["book"],
      Class: snapshot["Class"],
      uid: snapshot["uid"],
      issueDate: snapshot["issueDate"],
      docId: snapshot["docId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "photoUrl": photoUrl,
        "book": book,
        "Class": Class,
        "uid": uid,
        "issueDate": issueDate,
        "docId": docId,
      };
}
