import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:yns_college_management/Resources/stroage_method.dart';
import 'package:yns_college_management/models/home_work.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadHomeWork(
    String description,
    Uint8List file,
    String uid,
    String name,
    String photoUrl,
    String Class,
    String subject,
    String department,
    String title,
  ) async {
    // asking uid here because we don't want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String homeWorkUrl =
          await StorageMethods().uploadImageToStorage('homeWork', file, true);
      String homeWorkId = const Uuid().v1(); // creates unique id based on time
      HomeWork homeWork = HomeWork(
        Class: Class,
        subject: subject,
        department: department,
        title: title,
        description: description,
        uid: uid,
        name: name,
        homeWorkId: homeWorkId,
        datePublished: DateTime.now(),
        homeWorkUrl: homeWorkUrl,
        photoUrl: photoUrl,
      );
      _firestore.collection('homeWork').doc(homeWorkId).set(homeWork.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
