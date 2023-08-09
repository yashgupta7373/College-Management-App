import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yns_college_management/pages/College%20Web/footer.dart';
import 'package:yns_college_management/pages/College%20Web/header.dart';

class AboutClgPage extends StatefulWidget {
  const AboutClgPage({super.key});
  @override
  State<AboutClgPage> createState() => _AboutClgPageState();
}

class _AboutClgPageState extends State<AboutClgPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        // App Bar
        appBar: AppBar(
            title: const Text("About College"),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            backgroundColor: Colors.teal[700]),
        body: SingleChildScrollView(
            child: Column(children: [
          // Header
          const Headerpng(),
          // Heading
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  "I.P. College Campus-2 \n is located at NH-91, Bulandshahr- Delhi Road, Bulandshahr. All self financing courses are being offered in this campus.",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Icon(Icons.compare_arrows, color: Colors.teal[900]),
          // Contain
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "I.P. College, Campus-2, Bulandshahr is situated at NH-91, BulandShahr Delhi Road, far away 3Km. from Bhoor Chauraha towards Delhi. Having three storey building, equiped with excellent infrastructure and high-tech facilities. This Campus-2 is originated and founded by I.P. College Campus-I, BulandShahr is situated at near siyana bus stand BulandShahr which has grant-in-aid courses recognized by UGC under section 2(f) and 12(b). The Parents Society of both campus is \"Ishwar Dayal Parsandi Devi Vidhya Prasarni Sabha\" a charitable society entitled to receive donations in under section '80G' of Income Tax. I.P. College campus-2 is covered in 24730 sqm. land. For dept of Teacher Education (M.Ed., B.Ed.,D.El.Ed.,etc.) total land area 10000 sqm. is earmarked and remaining land area i.e. 14730 sqm. is earmarked for BCA, BBA, B.Sc.(B.T.), Msc.(B.T.) courses. Total built up area I.P. College, Campus-2 is 9172.49 sqm. certified by architect and BKDA BulandShahr. In which 4506 sqm. build up area is demarked for Teacher Education. In this campus all self-finance courses i.e. B.Ed., M.Ed., D.El.Ed., M.Phil.(Edu), BCA, BBA, B.Sc.(B.T.), M.Sc.(B.T.) are being offered after taken permission of shifting premises from Campus I to Campus-2 by honourable body as NCTE, UP Govt. and CCS University.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          const SizedBox(height: 20),
          // Management Committee
          SizedBox(
              width: 200,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.teal[700],
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                              bottom: Radius.circular(11)))),
                  child: const Text("Management Committee",
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const AboutManagementPage()));
                  })),
          const SizedBox(height: 10),
          // Vision And Mission
          SizedBox(
              width: 200,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.teal[700],
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                              bottom: Radius.circular(11)))),
                  child: const Text("Vision & Mission",
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const AboutMissionPage()));
                  })),
          const SizedBox(height: 10),
          // Founder
          SizedBox(
              width: 200,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.teal[700],
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                              bottom: Radius.circular(11)))),
                  child: const Text("Founder",
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const AboutFounderPage()));
                  })),
          const SizedBox(height: 10),
          // Staff
          SizedBox(
              width: 200,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.teal[700],
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                              bottom: Radius.circular(11)))),
                  child: const Text("Staff",
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const AboutStaffPage()));
                  })),
          const SizedBox(height: 20),
          // Footer
          const footer()
        ])));
  }
}

// About Management Committee
class AboutManagementPage extends StatefulWidget {
  const AboutManagementPage({super.key});
  @override
  State<AboutManagementPage> createState() => _AboutManagementPageState();
}

class _AboutManagementPageState extends State<AboutManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text("Management Committee"),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            backgroundColor: Colors.teal[700]),
        body: SingleChildScrollView(
            child: Column(children: [
          const Headerpng(),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Management Committee",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Icon(Icons.compare_arrows, color: Colors.teal[900]),
          Image.asset('assets/images/img6.jpg',
              width: double.infinity, fit: BoxFit.cover),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Both campus or colleges are run by Ishwar Dayal Parsandi Devi Vidhya Prasarni Sabha, Bulandshahr which is a registered body under Society Registration Act. This was founded in 1969 with the intention to develop and spread general and technical education among students. The parent society of the college Ishwar Dayal Parsandi Devi Vidhya Prasarni Sabha (Reg.), Bulandshahr -203001 (U.P.) is a charitable society and is entitled to receive donations under Income Tax clause '80 G' for which certificate issued will be valid for Income Tax purpose.\nManagement Committee - The general body of the Society elects the Executive Body of the Society after every five years. The executive body of the Society, Principal of the college, teachers equal to 25 % strength of the teachers members by rotation and a non-teaching member by rotation every year together constitute management committee of the college.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          const footer()
        ])));
  }
}

// About Founder
class AboutFounderPage extends StatefulWidget {
  const AboutFounderPage({super.key});
  @override
  State<AboutFounderPage> createState() => _AboutFounderPageState();
}

class _AboutFounderPageState extends State<AboutFounderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text("Founder"),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            backgroundColor: Colors.teal[700]),
        body: SingleChildScrollView(
            child: Column(children: [
          const Headerpng(),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Founder",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Icon(Icons.compare_arrows, color: Colors.teal[900]),
          Image.asset('assets/images/img7.jpg',
              width: double.infinity, fit: BoxFit.cover),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "The College was founded in 1970 by Late Shri Iswar Dayal Ji and his wife Late Smt. Parsandi Devi Ji.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          const footer()
        ])));
  }
}

// Vision & Mission
class AboutMissionPage extends StatefulWidget {
  const AboutMissionPage({super.key});
  @override
  State<AboutMissionPage> createState() => _AboutMissionPageState();
}

class _AboutMissionPageState extends State<AboutMissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text("Vision & Mission"),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            backgroundColor: Colors.teal[700]),
        body: SingleChildScrollView(
            child: Column(children: [
          const Headerpng(),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Vision And Mission",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Icon(Icons.compare_arrows, color: Colors.teal[900]),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Objective:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Text("Vision -",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.teal[900]),
              textAlign: TextAlign.center),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
                "The vision of the IP society is to ensure holistic development of the youth while inculcating traditional value system, promoting the use of technology, fostering global competency and including a quest for creativity; innovation and excellence in students for contributing to national integration and development and for producing socially responsible and aware future citizens to hold I. P. College's torch high..",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.white)),
          ),
          Text("\nMISSION -",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.teal[900]),
              textAlign: TextAlign.center),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
                "In its mission, the society is committed to cater to the educational needs of the area at large and socio - economically weaker sections of the society in particular. The society aims to pursue quality and excellence and to set pace in the field of higher education through novel educational endeavors for achieving fullest development of human potential in order to meet the future demands and challenges in context of emerging global knowledge society.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.white)),
          ),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("VALUES -",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
                "'Satyamev Jayate, Tamso maa Jyotirgamay' \"(Truth always triumphs and lead me unto light)\".\n'Vidhya Dhanam, Param Dhanam' \"'The Wealth of Learning is supreme\". \nContributing to national Integration and Development.\nFulfilment of educational needs of society.\nQuest for excellence\nPreservation of Indian Culture and Heritage..",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.white)),
          ),
          const SizedBox(height: 20),
          const footer()
        ])));
  }
}

// Staff
class AboutStaffPage extends StatefulWidget {
  const AboutStaffPage({super.key});
  @override
  State<AboutStaffPage> createState() => _AboutStaffPageState();
}

class _AboutStaffPageState extends State<AboutStaffPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text("Staff"),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            backgroundColor: Colors.teal[700]),
        body: SingleChildScrollView(
            child: Column(children: [
          const Headerpng(),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
              child: Text("Staff",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Icon(Icons.compare_arrows, color: Colors.teal[900]),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Principal",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img8.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text(
                  "\nDepartment of Teacher Education (D.El.Ed., B.Ed. & M.Ed.)",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img9.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text(
                  "\nDepartment of Computer Science (B.C.A. & M.Sc. in Computer Science)",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img10.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text(
                  "\nDepartment of Biotechnology (B.Sc. in Bio-tech, M.Sc. in Bio-tech, B.Sc. in Bio & B.Sc. in Maths)",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img11.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text(
                  "\nDepartment of Commerce & Business Administration (B.B.A., B.Com. & M.Com)",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img12.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("\nNon-teaching Staff List",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img13.jpg',
              width: double.infinity, fit: BoxFit.cover),
          const SizedBox(height: 20),
          const footer()
        ])));
  }
}

// Books & Library
class BooksLibraryPage extends StatefulWidget {
  const BooksLibraryPage({super.key});
  @override
  State<BooksLibraryPage> createState() => _BooksLibraryPageState();
}

class _BooksLibraryPageState extends State<BooksLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text("Books & Library"),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            backgroundColor: Colors.teal[700]),
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(height: 30),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Resource Centres",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Icon(Icons.compare_arrows, color: Colors.teal[900]),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/img31.jpg', fit: BoxFit.cover)),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/img33.jpg', fit: BoxFit.cover)),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/img51.jpg', fit: BoxFit.cover)),
          const footer()
        ])));
  }
}

// Games & Sports
class GameSportsPage extends StatefulWidget {
  const GameSportsPage({super.key});
  @override
  State<GameSportsPage> createState() => _GameSportsPageState();
}

class _GameSportsPageState extends State<GameSportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text("Games & Sports"),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            backgroundColor: Colors.teal[700]),
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(height: 30),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Sports and Games",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Icon(Icons.compare_arrows, color: Colors.teal[900]),
          const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                  "Games and Sports are encouraged in college to develop fitness, physical and neuromuscular skills and to promote the spirit of cooperation and sportsman.C.C.S. university, Meerut organizes inter collegiate level events to select university team to participate in Zonal level and National level university sports meets.The Followings games and sports available for students in I.P.College Bulandshahr:-1. Basketball, 2. Chess, 3. Cricket, 4. Volleyball, 5. Table-Tennis, 6. Athletics, 7. Kho-Kho , 8. Kabbadi, 9. Handball, 10. Badminton.",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                  textAlign: TextAlign.justify)),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/img52.jpg', fit: BoxFit.cover)),
          const footer()
        ])));
  }
}
