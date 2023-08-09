// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yns_college_management/Resources/stroage_method.dart';
import 'package:yns_college_management/models/user.dart' as model;

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user details..
  Future<model.AdminAndTeachers> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.AdminAndTeachers.fromSnap(documentSnapshot);
  }

// Teachers or Admin Registration
  Future<String> AddAdminOrTeacher(
      {required String role,
      required String id,
      required String subject,
      required String profile,
      required String department,
      required String language,
      required String name,
      required String fName,
      required String mName,
      required String dob,
      required String aadharNo,
      required String gender,
      required String transport,
      required String address,
      required String phoneNo,
      required Uint8List file,
      required String email,
      required String password}) async {
    String res = "Some Error occurred";
    try {
      if (role.isNotEmpty ||
          id.isNotEmpty ||
          subject.isNotEmpty ||
          profile.isNotEmpty ||
          department.isNotEmpty ||
          language.isNotEmpty ||
          name.isNotEmpty ||
          fName.isNotEmpty ||
          mName.isNotEmpty ||
          dob.isNotEmpty ||
          aadharNo.isNotEmpty ||
          gender.isNotEmpty ||
          transport.isNotEmpty ||
          address.isNotEmpty ||
          phoneNo.isNotEmpty ||
          file != null ||
          email.isNotEmpty ||
          password.isNotEmpty) {
        // register the user...
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // String uid = const Uuid().v1();
        //image
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        //user model...
        model.AdminAndTeachers user = model.AdminAndTeachers(
            role: role,
            id: id,
            subject: subject,
            profile: profile,
            department: department,
            language: language,
            name: name,
            fName: fName,
            mName: mName,
            dob: dob,
            aadharNo: aadharNo,
            gender: gender,
            transport: transport,
            address: address,
            phoneNo: phoneNo,
            photoUrl: photoUrl,
            email: email,
            uid: cred.user!.uid);
        // add user in database...
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        // _firestore.collection('users').doc(uid).set(user.toJson());
        res = "Success";
        signOut();
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Student Registration
  Future<String> AddStudent(
      {required String role,
      required String session,
      required String Class,
      required String department,
      required String id,
      required String name,
      required String fName,
      required String mName,
      required String dob,
      required String aadharNo,
      required String gender,
      required String transport,
      required String category,
      required String gOccupation,
      required String gIncome,
      required String address,
      required String phoneNo,
      required String email,
      required Uint8List file,
      required String password}) async {
    String res = "Some Error occurred";
    try {
      if (role.isNotEmpty ||
          session.isNotEmpty ||
          Class.isNotEmpty ||
          department.isNotEmpty ||
          id.isNotEmpty ||
          name.isNotEmpty ||
          fName.isNotEmpty ||
          mName.isNotEmpty ||
          dob.isNotEmpty ||
          aadharNo.isNotEmpty ||
          gender.isNotEmpty ||
          transport.isNotEmpty ||
          category.isNotEmpty ||
          gOccupation.isNotEmpty ||
          gIncome.isNotEmpty ||
          address.isNotEmpty ||
          phoneNo.isNotEmpty ||
          email.isNotEmpty ||
          file != null ||
          password.isNotEmpty) {
        // register the user...
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //image
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        //user
        model.Student user = model.Student(
            role: role,
            session: session,
            Class: Class,
            department: department,
            id: id,
            name: name,
            fName: fName,
            mName: mName,
            dob: dob,
            aadharNo: aadharNo,
            gender: gender,
            transport: transport,
            category: category,
            gOccupation: gOccupation,
            gIncome: gIncome,
            address: address,
            phoneNo: phoneNo,
            photoUrl: photoUrl,
            email: email,
            uid: cred.user!.uid);
        // add user in database...
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        // _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
        res = "Success";
        signOut();
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // log out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
