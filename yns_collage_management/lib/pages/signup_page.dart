// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/Resources/auth_method.dart';
import 'package:yns_college_management/pages/login_page.dart';
import '../../Utils/utils.dart';
import '../../Widgets/siginup_and_login_page_widget.dart';
import 'navigation_bar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => Controller();
}

class Controller extends State<SignUpPage> {
  var isPasswordVisible = true;
  var isPasswordVisible2 = true;
  bool _isLoading = false;
  var role;
  // Controller...
  final TextEditingController Id = TextEditingController();
  final TextEditingController Email = TextEditingController();
  final TextEditingController Password = TextEditingController();
  Uint8List? _image;
  final forrmkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    Id.dispose();
    Email.dispose();
    Password.dispose();
  }

  void signUpUser() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // sign up user using our authMethods
    String res = await AuthMethods().AddAdminOrTeacher(
        email: Email.text,
        password: Password.text,
        aadharNo: '',
        address: '',
        department: '',
        dob: '',
        id: Id.text,
        fName: '',
        gender: '',
        language: '',
        name: '',
        mName: '',
        phoneNo: '',
        profile: '',
        role: '',
        subject: '',
        file: _image!,
        transport: 'No');
    // if string returned is success, user has been created
    if (res == "Success") {
      // navigate to the home screen
      Navigator.pushReplacement(context,
          PageTransition(type: PageTransitionType.fade, child: BottomNavBar()));
      setState(() {
        // _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
    // show the error
    showSnackBar(context, res);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(165, 90, 255, 1.0),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            toolbarHeight: 28),
        body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(165, 90, 255, 1.0),
              Color.fromRGBO(195, 77, 235, 1),
              Color.fromRGBO(100, 232, 222, 1.0),
              Color.fromRGBO(88, 199, 189, 1)
            ], begin: Alignment.topLeft, end: Alignment.centerLeft)),
            child: SingleChildScrollView(
                child: Column(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text('Welcome',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.teal[800],
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Pacifico'))),
                Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Signup into your account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[700],
                            fontFamily: 'Pacifico'))),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                    child: Container(
                        height: mediaQuery.size.height * 0.68,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(100, 232, 221, 0.500),
                                  Color.fromRGBO(137, 120, 235, 0.500)
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.centerRight),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(5, 10),
                                  blurRadius: 20,
                                  color: Colors.teal.shade900.withOpacity(0.5))
                            ],
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(100),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(100),
                                topRight: Radius.circular(50))),
                        child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, left: 25),
                                      child: Text('Sign Up',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Pacifico'))),
                                  SizedBox(height: 0),
                                  // Role
                                  Column(children: [
                                    Center(
                                        child: FittedBox(
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                          const Text('Admin',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          Radio(
                                              value: 'admin',
                                              activeColor: Colors.white,
                                              fillColor: MaterialStateColor
                                                  .resolveWith(
                                                      (states) => Colors.white),
                                              groupValue: role,
                                              onChanged: (value) {
                                                setState(() {
                                                  role = value.toString();
                                                });
                                              }),
                                          const Text('Teacher',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          Radio(
                                              value: 'teacher',
                                              activeColor: Colors.white,
                                              fillColor: MaterialStateColor
                                                  .resolveWith(
                                                      (states) => Colors.white),
                                              groupValue: role,
                                              onChanged: (value) {
                                                setState(() {
                                                  role = value.toString();
                                                });
                                              }),
                                          const Text('Student',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          Radio(
                                              value: 'student',
                                              activeColor: Colors.white,
                                              fillColor: MaterialStateColor
                                                  .resolveWith(
                                                      (states) => Colors.white),
                                              groupValue: role,
                                              onChanged: (value) {
                                                setState(() {
                                                  role = value.toString();
                                                });
                                              })
                                        ])))
                                  ]),
                                  // Enter Your Admin ID....
                                  SignUpPageTextField(
                                      textEditingController: Id,
                                      hint: 'AD203458',
                                      label: 'Create Your Admin ID',
                                      icon: Icons.person),
                                  // Enter Email ID...
                                  SignUpPageTextField(
                                      textEditingController: Email,
                                      hint: 'YNSManagement@gmail.com',
                                      label: 'Enter Your Email ID',
                                      icon: Icons.email),
                                  // Create Password...
                                  Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: SizedBox(
                                          height: mediaQuery.size.height * 0.09,
                                          child: TextField(
                                              controller: Password,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.white),
                                              cursorColor: Colors.white,
                                              obscureText: isPasswordVisible,
                                              decoration: InputDecoration(
                                                  hintText: 'v55tyr54@',
                                                  hintStyle: TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color: Color.fromARGB(
                                                          117, 255, 255, 255)),
                                                  labelText: "Create Password",
                                                  labelStyle: TextStyle(
                                                      fontSize: 15,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.white),
                                                  prefixIcon: const Icon(
                                                      Icons.lock,
                                                      color: Colors.white),
                                                  suffixIcon: IconButton(
                                                      color: Colors.white,
                                                      icon: isPasswordVisible
                                                          ? const Icon(
                                                              Icons.visibility)
                                                          : const Icon(Icons
                                                              .visibility_off),
                                                      onPressed: () {
                                                        if (isPasswordVisible ==
                                                            true) {
                                                          isPasswordVisible =
                                                              false;
                                                        } else {
                                                          isPasswordVisible =
                                                              true;
                                                        }
                                                        setState(() {});
                                                      }),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      borderSide: const BorderSide(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(20),
                                                      borderSide: BorderSide(color: Color.fromARGB(117, 255, 255, 255), width: 1.5)),
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)))))),
                                  // Sign Up Button...
                                  Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                          child: SizedBox(
                                              width:
                                                  mediaQuery.size.width * 0.6,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    signUpUser();
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      elevation: 20,
                                                      backgroundColor:
                                                          Colors.teal[500],
                                                      shadowColor:
                                                          Colors.teal[400],
                                                      side: BorderSide(
                                                          color: Colors
                                                              .teal.shade500,
                                                          width: 2,
                                                          style: BorderStyle
                                                              .solid),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(
                                                              20.0)),
                                                      minimumSize:
                                                          const Size(20, 50)),
                                                  child: !_isLoading
                                                      ? const Text('Sign up')
                                                      : const CircularProgressIndicator(
                                                          color: Color.fromARGB(
                                                              255, 137, 167, 172)))))),
                                  // Login Button...
                                  Center(
                                      child: SignUpPageChangeButton(
                                          text1: 'Already Registered?  ',
                                          text2: 'Login.',
                                          ontap: () {
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                    child: const LoginPage()));
                                          }))
                                ])))),
                // signup with...
                Center(
                    child: SignUpPageChangeButton(
                        text1: '--- Sign Up With ---',
                        text2: '',
                        ontap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const LoginPage()));
                        })),
                // logo
                Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 15,
                                  backgroundImage:
                                      AssetImage("assets/images/img67.png")),
                              const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 15,
                                  backgroundImage:
                                      AssetImage("assets/images/img68.jpg")),
                              const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 15,
                                  backgroundImage:
                                      AssetImage("assets/images/img69.png")),
                              const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 15,
                                  backgroundImage:
                                      AssetImage("assets/images/img70.jpg"))
                            ])))
              ])
            ]))));
  }
}
