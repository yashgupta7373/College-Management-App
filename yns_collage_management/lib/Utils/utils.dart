import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// for displaying snackbar
showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: const Color.fromARGB(255, 17, 116, 85),
      elevation: 5,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5)));
}

// for picking up image from gallery
pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
  }
}
