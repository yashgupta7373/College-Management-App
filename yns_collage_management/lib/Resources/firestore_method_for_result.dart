import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:yns_college_management/Resources/stroage_method.dart';
import 'package:yns_college_management/models/result.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadResult(
    String description,
    Uint8List file,
    String uid,
    String name,
    String photoUrl,
    String Class,
    String department,
    String title,
    String id,
  ) async {
    // asking uid here because we don't want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String resultUrl =
          await StorageMethods().uploadImageToStorage('Result', file, true);
      String resultId = const Uuid().v1(); // creates unique id based on time
      Result result = Result(
          Class: Class,
          department: department,
          title: title,
          description: description,
          uid: uid,
          name: name,
          resultId: resultId,
          datePublished: DateTime.now(),
          resultUrl: resultUrl,
          photoUrl: photoUrl,
          id: id);
      _firestore.collection('result').doc(resultId).set(result.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
