// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class PhotoViewPage extends StatelessWidget {
  String image;
  PhotoViewPage({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[500],
        appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
        body: Center(
            child: InteractiveViewer(
                clipBehavior: Clip.none, child: Image.network(image))));
  }
}
