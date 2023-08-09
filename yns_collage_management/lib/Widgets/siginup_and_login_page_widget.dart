import 'package:flutter/material.dart';

// For Text Fields...
class SignUpPageTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hint;
  final String label;
  final IconData icon;

  const SignUpPageTextField(
      {Key? key,
      required this.textEditingController,
      required this.hint,
      required this.label,
      required this.icon})
      : super(key: key);

  @override
  State<SignUpPageTextField> createState() => _SignUpPageTextFieldState();
}

class _SignUpPageTextFieldState extends State<SignUpPageTextField> {
  var isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
            height: mediaQuery.size.height * 0.09,
            child: TextFormField(
                controller: widget.textEditingController,
                style: const TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: const TextStyle(
                        fontStyle: FontStyle.normal,
                        color: Color.fromARGB(117, 255, 255, 255)),
                    labelText: widget.label,
                    labelStyle: const TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                    prefixIcon: Icon(widget.icon, color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(117, 255, 255, 255),
                            width: 1.5)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))))));
  }
}

// page swipe text color...
class SignUpPageChangeButton extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback ontap;

  const SignUpPageChangeButton(
      {Key? key, required this.text1, required this.text2, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(14.0),
        child: InkWell(
            onTap: ontap,
            child: RichText(
                text: TextSpan(
                    text: text1,
                    style: TextStyle(fontSize: 15, color: Colors.teal[900]),
                    children: [
                  TextSpan(
                      text: text2,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          color: Colors.red[300],
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500))
                ]))));
  }
}
