import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:yns_college_management/models/courses.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future uploadCourse(
    String uid,
    String name,
    String photoUrl,
    String department,
    String cId,
    String cName,
    // String semester,
    String fees,
    // List<String> subject,
  ) async {
    // asking uid here because we don't want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      // String noticeUrl =
      //     await StorageMethods().uploadImageToStorage('Notice', file, true);
      String courseId = const Uuid().v1(); // creates unique id based on time
      Course course = Course(
          uid: uid,
          name: name,
          photoUrl: photoUrl,
          department: department,
          cId: cId,
          cName: cName,
          // semester: semester,
          fees: fees,
          docId: courseId
          // subject: subject,
          );
      _firestore.collection('courses').doc(courseId).set(course.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
