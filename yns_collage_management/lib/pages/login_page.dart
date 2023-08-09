// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/pages/forgot_Password.dart';
import '../../Resources/auth_method.dart';
import '../../Utils/utils.dart';
import '../../Widgets/siginup_and_login_page_widget.dart';
import 'navigation_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // String role = '';
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  var isPasswordVisible = true;
  bool isLoading = false;
  final forrmkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods()
        .loginUser(email: email.text, password: password.text);
    if (res == 'success') {
      Navigator.pushReplacement(context,
          PageTransition(type: PageTransitionType.fade, child: BottomNavBar()));
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
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
                    child: Text('Welcome Back',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.teal[800],
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Pacifico'))),
                Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text('Login back into your account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[700],
                            fontFamily: 'Pacifico'))),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 40.0, left: 15, right: 15),
                    child: Container(
                        height: mediaQuery.size.height * 0.6,
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
                                  // Title
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 35, bottom: 30),
                                      child: Text('Log In',
                                          style: TextStyle(
                                              fontSize: 40,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Pacifico'))),
                                  SizedBox(height: 5),

                                  // Enter Email ID...
                                  SignUpPageTextField(
                                      textEditingController: email,
                                      hint: 'YNSmanagement@gmail.com',
                                      label: 'Enter Your Email ID',
                                      icon: Icons.email),
                                  // Create Password...
                                  Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: SizedBox(
                                          height: mediaQuery.size.height * 0.09,
                                          child: TextField(
                                              controller: password,
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
                                  // Log in Button...
                                  Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Center(
                                          child: SizedBox(
                                              width:
                                                  mediaQuery.size.width * 0.6,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    loginUser();
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
                                                  child: !isLoading
                                                      ? const Text('Log In')
                                                      : const CircularProgressIndicator(
                                                          color: Color.fromARGB(
                                                              255, 137, 167, 172)))))),
                                  // Forgot Password...
                                  Center(
                                      child: SignUpPageChangeButton(
                                          text1: 'Forgot Password?',
                                          text2: '',
                                          ontap: () {
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child:
                                                        ForgotPasswordPage()));
                                          })),
                                  // // sign up link...
                                  // Center(
                                  //     child: SignUpPageChangeButton(
                                  //         text1: 'Don\'t have an account?  ',
                                  //         text2: 'Sign Up',
                                  //         ontap: () {
                                  //           Navigator.push(
                                  //               context,
                                  //               PageTransition(
                                  //                   type: PageTransitionType
                                  //                       .rightToLeft,
                                  //                   child: const SignUpPage()));
                                  //         }))
                                ])))),
                // // signup with...
                // Center(
                //     child: SignUpPageChangeButton(
                //         text1: '--- Log In With ---',
                //         text2: '',
                //         ontap: () {
                //           Navigator.push(
                //               context,
                //               PageTransition(
                //                   type: PageTransitionType.rightToLeft,
                //                   child: const LoginPage()));
                //         })),
                // // logo
                // Center(
                //     child: Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 70),
                //         child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: const [
                //               CircleAvatar(
                //                   backgroundColor: Colors.white,
                //                   radius: 15,
                //                   backgroundImage:
                //                       AssetImage("assets/images/img67.png")),
                //               CircleAvatar(
                //                   backgroundColor: Colors.white,
                //                   radius: 15,
                //                   backgroundImage:
                //                       AssetImage("assets/images/img68.jpg")),
                //               CircleAvatar(
                //                   backgroundColor: Colors.white,
                //                   radius: 15,
                //                   backgroundImage:
                //                       AssetImage("assets/images/img69.png")),
                //               CircleAvatar(
                //                   backgroundColor: Colors.white,
                //                   radius: 15,
                //                   backgroundImage:
                //                       AssetImage("assets/images/img70.jpg"))
                //             ])))
              ])
            ]))));
  }
}
