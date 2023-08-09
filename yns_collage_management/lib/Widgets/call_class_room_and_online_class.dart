// Call Class Room And Online Class
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CallClasses extends StatelessWidget {
  const CallClasses({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  backgroundColor: const Color.fromRGBO(100, 232, 222, 0.7),
                  content: SizedBox(
                      height: 50,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Online Class
                            InkWell(
                                onTap: (() async {
                                  Navigator.of(ctx).pop();
                                  await LaunchApp.openApp(
                                      androidPackageName:
                                          'us.zoom.videomeetings',
                                      iosUrlScheme: 'zoom?src=serp',
                                      openStore: true);
                                }),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: const [
                                      Icon(FontAwesomeIcons.video,
                                          color: Colors.white),
                                      Text('Online Classes',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white))
                                    ])),
                            // // Class Room
                            // InkWell(
                            //     onTap: (() async {
                            //       Navigator.of(ctx).pop();
                            //       await LaunchApp.openApp(
                            //           androidPackageName:
                            //               'com.google.android.apps.classroom',
                            //           iosUrlScheme:
                            //               'google-classroom/id924620788',
                            //           openStore: true);
                            //     }),
                            //     child: Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceAround,
                            //         children: const [
                            //           Icon(FontAwesomeIcons.chalkboardUser,
                            //               color: Colors.white),
                            //           Text('Class Room       ',
                            //               style: TextStyle(
                            //                   fontSize: 15,
                            //                   fontStyle: FontStyle.normal,
                            //                   fontWeight: FontWeight.bold,
                            //                   color: Colors.white))
                            //         ]))
                          ]))));
        },
        child:
            const Icon(FontAwesomeIcons.personChalkboard, color: Colors.white));
  }
}
