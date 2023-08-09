// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

// for Admin or Teacher...
class AdminAndTeachers {
  final String role;
  final String id;
  final String subject;
  final String profile;
  final String department;
  final String language;
  final String name;
  final String fName;
  final String mName;
  final String dob;
  final String aadharNo;
  final String gender;
  final String transport;
  final String address;
  final String phoneNo;
  final String photoUrl;
  final String email;
  final String uid;

  const AdminAndTeachers(
      {required this.role,
      required this.id,
      required this.subject,
      required this.profile,
      required this.department,
      required this.language,
      required this.name,
      required this.fName,
      required this.mName,
      required this.dob,
      required this.aadharNo,
      required this.gender,
      required this.transport,
      required this.address,
      required this.phoneNo,
      required this.photoUrl,
      required this.email,
      required this.uid});

  static AdminAndTeachers fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return AdminAndTeachers(
        role: snapshot["role"],
        id: snapshot["id"],
        subject: snapshot["subject"],
        profile: snapshot["profile"],
        department: snapshot["department"],
        language: snapshot["language"],
        name: snapshot["name"],
        fName: snapshot["fName"],
        mName: snapshot["mName"],
        dob: snapshot["dob"],
        aadharNo: snapshot["aadharNo"],
        gender: snapshot["gender"],
        transport: snapshot["transport"],
        address: snapshot["address"],
        phoneNo: snapshot[" phoneNo"],
        photoUrl: snapshot["photoUrl"],
        email: snapshot["email"],
        uid: snapshot["uid"]);
  }

  Map<String, dynamic> toJson() => {
        'role': role,
        'id': id,
        'subject': subject,
        'profile': profile,
        'department': department,
        'language': language,
        'name': name,
        'fName': fName,
        'mName': mName,
        'dob': dob,
        'aadharNo': aadharNo,
        'gender': gender,
        'transport': transport,
        'address': address,
        'phoneNo': phoneNo,
        "photoUrl": photoUrl,
        'email': email,
        'uid': uid
      };
}

// for Student...
class Student {
  final String role;
  final String session;
  final String Class;
  final String department;
  final String id;
  final String name;
  final String fName;
  final String mName;
  final String dob;
  final String aadharNo;
  final String gender;
  final String transport;
  final String category;
  final String gOccupation;
  final String gIncome;
  final String address;
  final String phoneNo;
  final String email;
  final String photoUrl;
  final String uid;

  const Student(
      {required this.role,
      required this.session,
      required this.Class,
      required this.department,
      required this.id,
      required this.name,
      required this.fName,
      required this.mName,
      required this.dob,
      required this.aadharNo,
      required this.gender,
      required this.transport,
      required this.category,
      required this.gOccupation,
      required this.gIncome,
      required this.address,
      required this.phoneNo,
      required this.email,
      required this.photoUrl,
      required this.uid});

  static Student fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Student(
        role: snapshot["role"],
        session: snapshot["session"],
        Class: snapshot["Class"],
        department: snapshot["department"],
        id: snapshot["id"],
        name: snapshot["name"],
        fName: snapshot["fName"],
        mName: snapshot["mName"],
        dob: snapshot["dob"],
        aadharNo: snapshot["aadharNo"],
        gender: snapshot["gender"],
        transport: snapshot["transport"],
        category: snapshot["category"],
        gOccupation: snapshot["gOccupation"],
        gIncome: snapshot["gIncome"],
        address: snapshot["address"],
        phoneNo: snapshot["phoneNo"],
        email: snapshot["email"],
        photoUrl: snapshot["photoUrl"],
        uid: snapshot["uid"]);
  }

  Map<String, dynamic> toJson() => {
        'role': role,
        'session': session,
        'Class': Class,
        'department': department,
        'id': id,
        'name': name,
        'fName': fName,
        'mName': mName,
        'dob': dob,
        'aadharNo': aadharNo,
        'gender': gender,
        'transport': transport,
        'category': category,
        'gOccupation': gOccupation,
        'gIncome': gIncome,
        'address': address,
        'phoneNo': phoneNo,
        'email': email,
        "photoUrl": photoUrl,
        'uid': uid
      };
}
