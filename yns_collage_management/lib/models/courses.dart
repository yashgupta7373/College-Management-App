import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  final String uid;
  final String name;
  final String photoUrl;
  final String department;
  final String cId;
  final String cName;
  final String fees;
  final String docId;

  const Course({
    required this.uid,
    required this.name,
    required this.photoUrl,
    required this.department,
    required this.cId,
    required this.cName,
    required this.fees,
    required this.docId,
  });

  static Course fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Course(
      uid: snapshot["uid"],
      name: snapshot["name"],
      photoUrl: snapshot['photoUrl'],
      department: snapshot["department"],
      cId: snapshot["cId"],
      cName: snapshot["cName"],
      fees: snapshot["fees"],
      docId: snapshot["docId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        'photoUrl': photoUrl,
        "department": department,
        "cId": cId,
        "cName": cName,
        "fees": fees,
        "docId": docId,
      };
}
