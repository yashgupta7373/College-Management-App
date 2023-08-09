import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yns_college_management/Widgets/siginup_and_login_page_widget.dart';

import '../Utils/utils.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController email = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());
      setState(() {
        isLoading = false;
      });
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text(
                'Password reset link sent!\nCheck your Email',
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal),
                textAlign: TextAlign.center,
              ),
            );
          });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, e.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
          title: const Text('Forgot Password!'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Enter Your Email and we will send you a password reset link',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // Enter Email ID...
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SignUpPageTextField(
                  textEditingController: email,
                  hint: 'YNSmanagement@gmail.com',
                  label: 'Enter Your Email ID',
                  icon: Icons.email),
            ),
            // Log in Button...
            Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                    child: SizedBox(
                        width: 180,
                        // mediaQuery.size.width * 0.6,
                        child: ElevatedButton(
                            onPressed: () {
                              passwordReset();
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 20,
                                backgroundColor: Colors.teal[600],
                                shadowColor: Colors.teal[400],
                                side: BorderSide(
                                    color: Colors.teal.shade500,
                                    width: 2,
                                    style: BorderStyle.solid),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                minimumSize: const Size(20, 50)),
                            child: !isLoading
                                ? const Text('Reset Password')
                                : const CircularProgressIndicator(
                                    color:
                                        Color.fromARGB(255, 137, 167, 172)))))),
          ],
        ));
  }
}
