import 'package:flutter/material.dart';

class InputFieldStudentRegistration extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType keyboard;

  const InputFieldStudentRegistration({
    Key? key,
    required this.textEditingController,
    required this.keyboard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: keyboard,
        controller: textEditingController,
        cursorColor: Colors.black,
        style: TextStyle(
            fontSize: 13, fontStyle: FontStyle.normal, color: Colors.blue[900]),
        decoration: const InputDecoration(contentPadding: EdgeInsets.all(8)));
  }
}
