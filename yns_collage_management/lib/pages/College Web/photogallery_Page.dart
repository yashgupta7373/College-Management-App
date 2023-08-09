// ignore_for_file: file_names
import 'package:flutter/material.dart';

class WallMagazine extends StatelessWidget {
  const WallMagazine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListWheelScrollView(itemExtent: 200, children: [
              Center(
                  child: Text("Gallery",
                      style: TextStyle(
                          shadows: [
                            Shadow(
                                color: Colors.teal.shade900,
                                blurRadius: 5,
                                offset: const Offset(2, 2))
                          ],
                          fontSize: 90,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img37.jpg',
                      fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img38.jpg',
                      fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img39.jpg',
                      fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img40.jpg',
                      fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img41.jpg',
                      fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img42.jpg',
                      fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img43.jpg',
                      fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child:
                      Image.asset('assets/images/img2.png', fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img31.jpg',
                      fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img32.jpg',
                      fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img33.jpg',
                      fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img34.jpg',
                      fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img44.jpg',
                      fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img45.jpg',
                      fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img46.jpg',
                      fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img47.jpg',
                      fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img48.jpg',
                      fit: BoxFit.cover)),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/images/img49.jpeg',
                      fit: BoxFit.cover)),
              Center(
                  child: Text("Gallery",
                      style: TextStyle(
                          shadows: [
                            Shadow(
                                color: Colors.teal.shade900,
                                blurRadius: 5,
                                offset: const Offset(2, 2))
                          ],
                          fontSize: 90,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)))
            ])));
  }
}
