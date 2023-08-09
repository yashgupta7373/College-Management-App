import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:yns_college_management/models/library.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future libraryBook(
    String name,
    String photoUrl,
    String id,
    String book,
    // String author,
    String Class,
    String uid,
    String date,
    // List<String> subject,
  ) async {
    // asking uid here because we don't want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String issueId = const Uuid().v1(); // creates unique id based on time
      Detail detail = Detail(
          name: name,
          photoUrl: photoUrl,
          id: id,
          book: book,
          // author: author,
          Class: Class,
          uid: uid,
          issueDate: date,
          docId: issueId);
      _firestore.collection('library').doc(issueId).set(detail.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
