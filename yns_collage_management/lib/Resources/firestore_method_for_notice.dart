import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:yns_college_management/Resources/stroage_method.dart';
import 'package:yns_college_management/models/notice.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadNotice(
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
      String noticeUrl =
          await StorageMethods().uploadImageToStorage('Notice', file, true);
      String noticeId = const Uuid().v1(); // creates unique id based on time
      Notice notice = Notice(
        Class: Class,
        department: department,
        title: title,
        description: description,
        uid: uid,
        name: name,
        // likes: [],
        noticeId: noticeId,
        datePublished: DateTime.now(),
        noticeUrl: noticeUrl,
        photoUrl: photoUrl,
        docId: noticeId,
      );
      _firestore.collection('notice').doc(noticeId).set(notice.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
