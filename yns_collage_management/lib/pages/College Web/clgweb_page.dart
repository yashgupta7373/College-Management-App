// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/pages/College%20Web/department.dart';
import 'package:yns_college_management/pages/College%20Web/footer.dart';
import 'package:yns_college_management/pages/College%20Web/photogallery_Page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'aboutclg_page.dart';
import 'header.dart';
import 'my_drawer_header.dart';

class ClgWebPage extends StatefulWidget {
  const ClgWebPage({super.key});
  @override
  State<ClgWebPage> createState() => _ClgWebPageState();
}

class _ClgWebPageState extends State<ClgWebPage> {
  // bool iconBool = false;
  // IconData iconLight = Icons.wb_sunny;
  // IconData iconDark = Icons.nights_stay;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.teal[300],
        // App Bar
        appBar: AppBar(
            title:
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                const Text('I.P. College, Campus-2'),
            //     IconButton(
            //         onPressed: () {
            //           setState(() {
            //             iconBool = !iconBool;
            //           });
            //         },
            //         icon: Icon(iconBool ? iconDark : iconLight))
            //   ],
            // ),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            backgroundColor: Colors.teal[700]),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: mediaQuery.size.height * 0.16,
                  width: mediaQuery.size.width * 1,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      border: Border.all(width: 1, color: Colors.teal.shade600),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.teal.shade900,
                            spreadRadius: 1)
                      ]),
                  child: FittedBox(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                height: 100,
                                child: Image.asset('assets/images/img30.png'))),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                      "I.P.(P.G.) College Campus-2,\nBulandshahr\n",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      textAlign: TextAlign.end),
                                  Text(
                                      "Affiliated to C.C.S. University, Meerut",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.black),
                                      textAlign: TextAlign.end)
                                ]))
                      ])))),
          const Headerpng(),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular((8))),
                      border: Border.all(width: 2, color: Colors.teal.shade600),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0,
                            color: Colors.teal.shade800,
                            spreadRadius: 1,
                            offset: const Offset(
                              12.0,
                              -12.0,
                            ))
                      ]),
                  //Brief Introduction
                  child: SingleChildScrollView(
                      child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Brief Introduction: ",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal[600]))),
                    const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            "I.P. (P.G.) College, Campus-2, Bulandshahr is situated at NH-91, Bulandshahr to Delhi, far away 3 Km. from Bhoor Chauraha towards Delhi. Having three storey building, well equipped with excellent infrastructure and high-tech facilities. This Campus-2 is originated and founded by I.P. College Campus-I, Bulandshahr is situated near siyana bus stand Bulandshahr which has grant-in-aid courses. The Parents Society of both campus is \"Ishwar Dayal Parsandi Devi Vidhya Prasarni Sabha\" a charitable society entitled to receive donations under section '80G' of Income Tax. I.P. College campus-2 is covered in 24730 sqm land. For Dept. of Teacher Education total land area 10000 sqm. is earmarked and remaining land area i.e. 14730 sqm. is earmarked for other courses. Total built up area of I.P. College, Campus-2 is 9172.49 sqm. certified and approved by architect and BDA. In this campus B.Ed., M.Ed., BCA, BBA, B.Sc.(B.T.), M.Sc.(B.T.) are being offered after taken permission of shifting premises from Campus I to Campus-2 by honourable body as NCTE, UP Govt. and CCS University and getting recognition by UGC under section 2(f) and 12(b) and D.El.Ed., B.Sc.(Home Science), B.Sc.(Maths), B.Sc.(Bio), B.Com., M.Com. and M.Sc.(Computer Science) are also being offered in this campus after getting affiliation and recognition by concerned honorable body.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontStyle: FontStyle.italic)))
                  ])))),
          const SizedBox(height: 10),

          // Departments...
          Text("Departments :-",
              style: TextStyle(
                  shadows: [
                    Shadow(
                        color: Colors.teal.shade800,
                        blurRadius: 5,
                        offset: const Offset(2, 2))
                  ],
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          Icon(Icons.keyboard_arrow_down,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                    color: Colors.teal.shade800,
                    blurRadius: 6.0,
                    offset: const Offset(2, 2))
              ]),

          // Department of computer Science
          Padding(
              padding: const EdgeInsets.only(
                  right: 16, left: 16, bottom: 16, top: 10),
              child: InkWell(
                  splashColor: Colors.teal[900],
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const Dep_Comp_Science()));
                  },
                  child: Ink(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11),
                          border:
                              Border.all(width: 1, color: Colors.teal.shade600),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.teal.shade900,
                                spreadRadius: 1)
                          ]),
                      height: 70,
                      width: double.infinity,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Department of Computer Science",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal[600])),
                            const Text("BCA, M.Sc. in Computer Science",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    color: Color.fromARGB(255, 0, 0, 0)))
                          ])))),
          // Department of commerce and business Administration
          Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
              child: InkWell(
                  splashColor: Colors.teal[900],
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const Dep_Business()));
                  },
                  child: Ink(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11),
                          border:
                              Border.all(width: 1, color: Colors.teal.shade600),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.teal.shade900,
                                spreadRadius: 1)
                          ]),
                      height: 70,
                      width: double.infinity,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                                "Department of Commerce & Business Administration",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal[600])),
                            const Text("BBA, B.Com & M.Com",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    color: Color.fromARGB(255, 0, 0, 0)))
                          ])))),
          // Department of teacher Education
          Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
              child: Ink(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(width: 1, color: Colors.teal.shade600),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.teal.shade900,
                            spreadRadius: 1)
                      ]),
                  height: 70,
                  width: double.infinity,
                  child: InkWell(
                      splashColor: Colors.teal[900],
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: const Dep_Teacher_Edu()));
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Department of Teacher Education",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal[600])),
                            const Text("D.El.Ed., B.Ed & Mteal.shade900",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    color: Color.fromARGB(255, 0, 0, 0)))
                          ])))),
          // Department of Science
          Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
              child: InkWell(
                  splashColor: Colors.teal[900],
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const Dep_Bio()));
                  },
                  child: Ink(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11),
                          border:
                              Border.all(width: 1, color: Colors.teal.shade600),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.teal.shade900,
                                spreadRadius: 1)
                          ]),
                      height: 90,
                      width: double.infinity,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Department of Science",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal[600])),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: const Dep_Bio()));
                              },
                              child: const Text("B.Sc & M.Sc. in Biotechnology",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic,
                                      color: Color.fromARGB(255, 233, 85, 85))),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: const Dep_BSC_HS()));
                              },
                              child: const Text("B.Sc (Home Science)",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic,
                                      color: Color.fromARGB(255, 233, 85, 85))),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: const Dep_BSC()));
                              },
                              child: const Text(
                                  "B.Sc (Bio) and B.Sc (Maths)-PCM",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic,
                                      color: Color.fromARGB(255, 233, 85, 85))),
                            )
                          ])))),
          // // Department of B.Sc(Home Science)
          // Padding(
          //     padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
          //     child: InkWell(
          //         splashColor: Colors.teal[900],
          //         onTap: () {
          //           Navigator.push(
          //               context,
          //               PageTransition(
          //                   type: PageTransitionType.fade,
          //                   child: const Dep_BSC_HS()));
          //         },
          //         child: Ink(
          //             decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 borderRadius: BorderRadius.circular(11),
          //                 border:
          //                     Border.all(width: 1, color: Colors.teal.shade600),
          //                 boxShadow: [
          //                   BoxShadow(
          //                       blurRadius: 10,
          //                       color: Colors.teal.shade900,
          //                       spreadRadius: 1)
          //                 ]),
          //             height: 70,
          //             width: double.infinity,
          //             child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 children: [
          //                   Text("Department of B.Sc (Home Science)",
          //                       style: TextStyle(
          //                           fontSize: 17,
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.teal[600])),
          //                   const Text("B.Sc (Home Science)",
          //                       style: TextStyle(
          //                           fontSize: 15,
          //                           fontStyle: FontStyle.italic,
          //                           color: Color.fromARGB(255, 0, 0, 0)))
          //                 ])))),
          // // Department of B.Sc
          // Padding(
          //     padding: const EdgeInsets.only(
          //       right: 16,
          //       left: 16,
          //       bottom: 10,
          //     ),
          //     child: InkWell(
          //         splashColor: Colors.teal[900],
          //         onTap: () {
          //           Navigator.push(
          //               context,
          //               PageTransition(
          //                   type: PageTransitionType.fade,
          //                   child: const Dep_BSC()));
          //         },
          //         child: Ink(
          //             decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 borderRadius: BorderRadius.circular(11),
          //                 border:
          //                     Border.all(width: 1, color: Colors.teal.shade600),
          //                 boxShadow: [
          //                   BoxShadow(
          //                       blurRadius: 10,
          //                       color: Colors.teal.shade900,
          //                       spreadRadius: 1)
          //                 ]),
          //             height: 70,
          //             width: double.infinity,
          //             child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 children: [
          //                   Text(
          //                     "Department of B.Sc",
          //                     style: TextStyle(
          //                       fontSize: 17,
          //                       fontWeight: FontWeight.bold,
          //                       color: Colors.teal[600],
          //                     ),
          //                   ),
          //                   const Text("B.Sc (Bio) and B.Sc (Maths)-PCM",
          //                       style: TextStyle(
          //                           fontSize: 15,
          //                           fontStyle: FontStyle.italic,
          //                           color: Color.fromARGB(255, 0, 0, 0)))
          //                 ])))),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(width: 1, color: Colors.teal.shade600),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.teal.shade900,
                            spreadRadius: 1)
                      ]))),

          // UGC e-resources portel url
          InkWell(
              onTap: () => launch('http://ugceresources.in/'),
              child: const Text("UGC e-resources portel :-",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Colors.red,
                            blurRadius: 5,
                            offset: Offset(2, 2))
                      ],
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 255, 255, 255)))),
          InkWell(
              onTap: () => launch('http://ugceresources.in/'),
              child: const Text("http://ugceresources.in",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Colors.red,
                            blurRadius: 5,
                            offset: Offset(2, 2))
                      ],
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 255, 255, 255)))),
          const SizedBox(height: 20),
          // Alumni Registration form link Url
          InkWell(
              onTap: () => launch(
                  'https://docs.google.com/forms/d/e/1FAIpQLSefhL_IsiC55xxtzTPCw_0TfL7iNOALTJo3ns0GEPcXw2gSdA/viewform'),
              child: const Text("Alumni Registration Form Link :-",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Colors.red,
                            blurRadius: 5,
                            offset: Offset(2, 2))
                      ],
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 255, 255, 255)))),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(width: 1, color: Colors.teal.shade600),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.teal.shade900,
                            spreadRadius: 1)
                      ]))),
          // E-content Url
          InkWell(
              onTap: () => launch('http://ipcollegebsr.org/new/econtent.php'),
              child: const Text("E-Content",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Colors.red,
                            blurRadius: 5,
                            offset: Offset(2, 2))
                      ],
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 255, 255, 255)))),
          Icon(Icons.compare_arrows, color: Colors.white, shadows: <Shadow>[
            Shadow(
                color: Colors.teal.shade800,
                blurRadius: 6.0,
                offset: const Offset(2, 2))
          ]),
          const SizedBox(height: 20),
          //Code of conduct Url
          InkWell(
              onTap: () => launch(
                  'http://www.ipcollegebsr.org/new/files/code%20of%20conduct.pdf'),
              child: const Text("Code of Conduct",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Colors.red,
                            blurRadius: 5,
                            offset: Offset(2, 2))
                      ],
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 255, 255, 255)))),
          Icon(Icons.compare_arrows, color: Colors.white, shadows: <Shadow>[
            Shadow(
                color: Colors.teal.shade800,
                blurRadius: 6.0,
                offset: const Offset(2, 2))
          ]),
          const SizedBox(height: 20),
          Stack(children: [
            SizedBox(
                width: double.infinity,
                child:
                    Image.asset('assets/images/img3.jpg', fit: BoxFit.cover)),
            // Staff
            Positioned(
                left: 50,
                top: 60,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const AboutStaffPage()));
                    },
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/img4.png',
                            fit: BoxFit.cover)))),
            Positioned(
                left: 50,
                top: 60,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const AboutStaffPage()));
                    },
                    child: const SizedBox(
                        height: 100,
                        width: 100,
                        child: Icon(Icons.content_copy, size: 40)))),
            Positioned(
                left: 80,
                top: 155,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const AboutStaffPage()));
                    },
                    child: const Text("Staff",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)))),
            // Books and Library
            Positioned(
                right: 50,
                top: 60,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const BooksLibraryPage()));
                    },
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/img4.png',
                            fit: BoxFit.cover)))),
            Positioned(
                right: 50,
                top: 60,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const BooksLibraryPage()));
                    },
                    child: const SizedBox(
                        height: 100,
                        width: 100,
                        child: Icon(Icons.local_library, size: 45)))),
            Positioned(
                right: 25,
                top: 155,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const BooksLibraryPage()));
                    },
                    child: const Text("Books & Library",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)))),
            // Game And Sports
            Positioned(
                left: 50,
                top: 240,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const GameSportsPage()));
                    },
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/img4.png',
                            fit: BoxFit.cover)))),
            Positioned(
                left: 50,
                top: 240,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const GameSportsPage()));
                    },
                    child: const SizedBox(
                        height: 100,
                        width: 100,
                        child: Icon(Icons.sports_tennis, size: 45)))),
            Positioned(
                left: 28,
                top: 335,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const GameSportsPage()));
                    },
                    child: const Text("Games & Sports",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)))),
            // Wall Magazine
            Positioned(
                right: 50,
                top: 240,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const WallMagazine()));
                    },
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/img4.png',
                            fit: BoxFit.cover)))),
            Positioned(
                right: 50,
                top: 240,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const WallMagazine()));
                    },
                    child: const SizedBox(
                        height: 100,
                        width: 100,
                        child: Icon(Icons.groups, size: 45)))),
            Positioned(
                right: 33,
                top: 335,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const WallMagazine()));
                    },
                    child: const Text("Wall Magazine",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20))))
          ]),
          const footer()
        ])),
        // Drawer...
        drawer: Drawer(
            child: SingleChildScrollView(
                child: Column(
                    children: const [MyHeaderDrawer(), MyDrawerlist()]))));
  }
}
