import 'package:flutter/widgets.dart';
import 'package:yns_college_management/Resources/auth_method.dart';
import 'package:yns_college_management/models/user.dart';

class UserProvider with ChangeNotifier {
  AdminAndTeachers? _user;
  final AuthMethods _authMethods = AuthMethods();

  AdminAndTeachers get getUser => _user!;

  Future<void> refreshUser() async {
    AdminAndTeachers user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
