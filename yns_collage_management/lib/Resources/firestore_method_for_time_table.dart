import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:yns_college_management/Resources/stroage_method.dart';
import 'package:yns_college_management/models/time_table.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadTimeTable(
    String description,
    Uint8List file,
    String uid,
    String name,
    String photoUrl,
    String Class,
    String department,
    String title,
  ) async {
    // asking uid here because we don't want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String timeTableUrl =
          await StorageMethods().uploadImageToStorage('TimeTable', file, true);
      String timeTableId = const Uuid().v1(); // creates unique id based on time
      TimeTable timeTable = TimeTable(
        Class: Class,
        department: department,
        title: title,
        description: description,
        uid: uid,
        name: name,
        timeTableId: timeTableId,
        datePublished: DateTime.now(),
        timeTableUrl: timeTableUrl,
        photoUrl: photoUrl,
        docId: timeTableId,
      );
      _firestore
          .collection('timeTable')
          .doc(timeTableId)
          .set(timeTable.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
