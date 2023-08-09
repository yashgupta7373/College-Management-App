import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../models/RRecord_library.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future libraryOldRecord(
    String Class,
    String name,
    String id,
    String book,
    String date,
    String photoUrl,
    String uid,
    // String author,
    // List<String> subject,
  ) async {
    // asking uid here because we don't want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String returnId = const Uuid().v1(); // creates unique id based on time
      RDetail detail = RDetail(
        name: name,
        photoUrl: photoUrl,
        id: id,
        book: book,
        // author: author,
        Class: Class,
        uid: uid,
        issueDate: date,
        docId: returnId,
        returnDate: DateTime.now().toString(),
      );
      _firestore
          .collection('oldLibraryRecord')
          .doc(returnId)
          .set(detail.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
