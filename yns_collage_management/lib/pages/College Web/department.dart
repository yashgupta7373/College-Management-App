// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:yns_college_management/pages/College%20Web/footer.dart';
import 'package:yns_college_management/pages/College%20Web/header.dart';

//Department Of Computer Science
class Dep_Comp_Science extends StatelessWidget {
  const Dep_Comp_Science({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        // App Bar
        appBar: AppBar(
            title: const Text('I.P. College, Campus-2'),
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
          Padding(
              padding: const EdgeInsets.all(16.0),
              //Heading
              child: Text("Department of Computer Science (B.C.A.)",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Icon(Icons.compare_arrows, color: Colors.teal[900]),
          //Contant
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "BCA is a three years full time degree course which consists of six semesters.Each even semester consists of five theory papers and two practical labs and each odd semester consists of four theory paper and one practical lab.Besides this BCA programme consists of two projects one is minor and other is major.Minor project based on industrial training and major project is the development of any innovative project like web sites, online projects, application softwares, database projects, android applications and mobile applications. The curriculum has been designed to give the students an in depth knowledge of various subjects related to information technology along with basic concept of management and core concept of mathematics. As per university syllabus department’s incharge designs an academic calendar every year. For successful implementation of this academic calendar, department circulate this calendar to all faculty members, paste it on notice board, and also published it on college website. All faculty members design a lecture plan before commencement of the session to strictly follow this academic calendar. Academic calendar also consists a schedules of admission, extra-curricular activities, co-curricular activities, sessional exam, college fest, placement drives, workshop/project and seminars.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Subjects Elucidation: -",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img14.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Eligibility Criteria :",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "10+2 with 45% marks for Gen/OBC and for SC/ST with 33% marks(Art with maths), AG/Bio/Science/Commerce. Maths mandatory either in 10th or 12th.",
                textAlign: TextAlign.justify,
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
              )),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Course Scope :",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Major roles that students can bag after completing a BCA programme is that of a System engineer, software tester, junior programmer, web developer, system administrator, software developer, system analyst etc",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Course Outcomes :",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "BCA graduates have good employability opportunities in IT sector, other than this so many opportunities also available in public sector organizations like banking, defence, administrator etc.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("PLACEMENT OF STUDENTS :",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img15.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Master of Science in Computer Science",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Icon(Icons.compare_arrows, color: Colors.teal[900]),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "MSc Computer Science or Master of Science in Computer Science is a 2-year degree program which caters to the needs of people interested in the field of computers. This 2-year course is considered one of the most sought after degrees in India in terms of personal growth and career growth opportunities. Students are provided with opportunities to develop and hone core competency in the field of computer science and encourage them to make a mark in the much sought after IT industry. Who may Apply (Eligibility Criteria): - Applicants should hold a 3-year bachelor's degree (or equivalent) in a field B Sc. IT / B Sc. CS / B.Sc. Mathematics or BCA. M.Sc. (Computer Science) Jobs and Career Options:- A career with exceptional prospective fields and challenging roles in a futuristic industry like Cyber Crime, Network Security, Computer Graphic and Multimedia Design (CAD, CAM), Computer vision and surveillance, Robotics, Artificial intelligence, Mobile devices must opt for this program. There are various jobs available for these MSc Computer Science students. “Masters in Computer Science” So hurry to join us (only 30 seats) Contact for admission and Updates on: Mobile No: 8954892206 Email id: admission@ipcollegebsr.org Website www.ipcollegebsr.org/admission",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Image.asset('assets/images/img16.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Eligibility Criteria :",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Applicants should hold a 3-year bachelor's degree (or equivalent) in a field B Sc. IT / B Sc. CS / B.Sc. Mathematics or BCA.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Jobs and Career Options :",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "A career with exceptional prospective fields and challenging roles in a futuristic industry like Cyber Crime, Network Security, Computer Graphic and Multimedia Design (CAD, CAM), Computer vision and surveillance, Robotics, Artificial intelligence, Mobile devices must opt for this program. There are various jobs available for these MSc Computer Science students and some of those include, IT industry- Software Engineer, Project Manager - Information Technology (IT), Technical Architect, Data Scientist, iOS Developer, Network administrator, Game Designer, Database Manager, Software Tester etc, In Academics - Assistant Professor- CSE, Lecturer(CS), NET(CS), Ph.D in Computer Science, M.Tech(CS),MCA(Under lateral Entry scheme),B.Ed., PGT Computer Science.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          // Footer
          const footer()
        ])));
  }
}

// Department of Teachers Education...
class Dep_Teacher_Edu extends StatelessWidget {
  const Dep_Teacher_Edu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text('I.P. College, Campus-2'),
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
              child: Text("Department of Teacher Education",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Icon(Icons.compare_arrows, color: Colors.teal[900]),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "In the premises of I.P. College Campus-I near Siyana bus stand Bulandshahr a department namely Kamla Devi Satish chandra B.Ed. Dept. was inaugurated on 27 april 2003, having full filled all requirements of NCTE, U.P. Govt. and CCS University rules and regulations. Further M.Ed. course was also initiated in 2006-2007 at same campus now days these both course are being offered in I.P.(P.G.) College, Campus-II on NH-91 Bulandshahr to Delhi after getting permission of shifting premises by honorable body as NCTE, U.P. Govt. and CCS University from I.P. Campus-I to I.P. Campus-II. In present there are three courses being offered as D.El.Ed., B.Ed.,M.Ed. in the P.G. Department of Teacher-Education.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Elucidation of Courses (B.Ed.)",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img17.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Admission procedure",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  " There is no provision to get direct admission in college without appearing in JEE.\n UP B.Ed. Joint Entrance Examination (UP B.Ed. JEE) is conducted by a university.\n JEE conducting university allots candidates to colleges as per their rank and choice.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("M.Ed.",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img18.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Admission procedure",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "There is no provision to get direct admission in college without appearing in CET.\n Combined entrance test (CET) is conducted by C.C.S. University, Meerut.\n CCS University allots candidate to colleges as per their rank and choice.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("D.El.Ed.",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img19.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Admission procedure",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  " Merit index is declared by SCERT on the basis of marks percentage achieved in 10th, 12th and graduation level.\n Candidates adhere all instructions and guidelines given by SCERT to get admission.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          const footer()
        ])));
  }
}

// Department of B.SC Home Science...
class Dep_BSC_HS extends StatelessWidget {
  const Dep_BSC_HS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text('I.P. College, Campus-2'),
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
              child: Text("Department of Science B.Sc. (Home science)",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Icon(Icons.compare_arrows, color: Colors.teal[900]),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "B.Sc. Home Science or Bachelor of Science in Home Science is an undergraduate Home Science professional course. Home Science covers the study of the various sciences that involve nutrition, health and growth measures including the science that deals with the surroundings and environment. The degree course mainly comprises of the study of the major topics of Home Science like Food Science, Fundamentals of Resource Management, Foundations of Human Development, Introduction to Fabric and Apparel Science, Foundations of Food and Nutrition, etc. In other words, B.Sc. (Home Science) is a degree course that includes the study of many disciplines such as chemistry, physics, physiology, biology, hygiene, economics, rural development, child development, sociology and family relations, community living, art, food, nutrition, clothing, textiles, and home management. The duration of the course three years and the syllabus for the course is divided into six semesters.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Scope",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "• B.Sc. (Home Science) degree serves as a basis for further higher studies in this field such as M.Sc., Ph.D. and M.Phil. Degree in Home Science, the successful completion of which makes one eligible for the post of a lecturer in any university/college.\n• B.Sc. (Home Science) degree graduates have the options of pursuing a career in various specializations of Home Science such as in Foods and Nutrition, Clothing and Textiles, Child Development, Home Management, and Extension Education.\n• A wide range of employment opportunities exists for B.Sc. (Home Science) degree holders in Hospitals, Cafeterias, Commercial Restaurants, Fashion Designing, Fashion Journalism, Apparel Merchandising, Consultancy and Counselling, Welfare Organizations, Extension Education and Community Development Programs.\n\nDuration : 3 years ( 6 Semesters)\nTotal Seats : 60\nEligibility : 10+2 with 45% marks for Gen./OBC & 40% marks for SC/ST (PCB/PCBE/PCMB) Or Home Science mandatory at 10th Or 12th level with Arts/Commerce\nSelection Procedure : The admission to the B.Sc. Home science program will be on the basis of the merit determined by the aggregate marks at 10+2 level.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Syllabus of B.Sc Home science",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img20.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Programme Outcome",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Home science has its own unique features which distinguishes itself from other subjects. It helps in improving the domestic skills like housekeeping, food preservation, stitching, interior decoration, cookery, home decoration, child rearing etc. which is of wide application now a days. Five disciplines of Home Science are focused upon the recent trends in the entrepreneur as well as job oriented. Along with it the knowledge of Home Science improves the quality of life: the study of home science provides the homemaker with the knowledge and skills required to manage a home effectively. Helps in the best utilization of resources to get maximum satisfaction and returns: Family resource management provides knowledge necessary to make intelligent decisions regarding the Purchases budgeting and other managerial activities. Helps to improve family relationships. Develops in the students the necessary skills and techniques required for better homemaking and family living. The importance of Home science has further increased to meet the demands of the modern society. The knowledge of Home science is derived from physical, social, and biological sciences and many arts, which is applied towards achieving better, healthier and happier homes.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("B.Sc. Home Science Employment Areas",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "• Apparel Merchandising Centres\n• Cafeterias\n• Commercial Restaurants\n• Community Development Programs\n• Consultancy and Counselling Centres\n• Dress-Making Units\n• Fashion Designing Companies\n• Fashion Journalism\n• Food Industry\n• Hospitals\n• Hotels\n• Manufacturing Industries\n• Sales Promotion of Food Items\n• Textile Businesses\n• Tourist Resorts\n• Welfare Organizations",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("B.Sc. Home Science Job Types",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "• Assistant Dress Designer\n• Assistant Fashion Designer\n• Baby Care Taker\n• Child Care Giver\n• Cook/Chef\n• Demonstrator\n• Food Analyst\n• Food Scientist\n• Health Care Worker\n• Hospital Attendant\n• Housekeeper\n• Nanny\n• Nutrition Expert\n• Pantry In-charge\n• Research Assistant\n• Teacher/Lecturer",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          const footer()
        ])));
  }
}

// Department of Commerce And Business Administration...
class Dep_Business extends StatelessWidget {
  const Dep_Business({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text('I.P. College, Campus-2'),
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
              child: Text("Department of Commerce & Business Administration",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Icon(Icons.compare_arrows, color: Colors.teal[900]),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("BBA (Bachelor of Business Administration) Course",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "The Bachelor in Business Administration program is designed to equip participants for the industry to become young managers at entry level positions. BBA is a 3-year – full time under-graduate semester programme which is affiliated to CCS University Meerut, equipped with an in-depth understanding of management theory & practices coupled with industry exposure. Equips students with requisite professional education and knowledge in business management for adding value to the industry and advancing learning students with requisite professional education and knowledge in business management for adding value to the industry and advancing learning. Provide state-of-the-art infrastructure to students, to support and propel their career paths, may it be managerial, administrative or entrepreneurial. Provide students with skills-based learning to give them a competitive edge in employability. The programme lays emphasis on creating an impeccable foundation by rendering specialization courses in domains entailing Finance, Marketing, Data Analytics and Entrepreneurship.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text(
                  "Subjects You Learn During The Program \nFrom Session 2020-2021 (New Revised Syllabus)",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img21.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text(
                  "The Elective papers in the functional specialization will be as follows:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img22.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text(
                  "Subjects You Learn During The Program\nFor 2018-2021 & 2019-2022",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img23.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Eligibility Criteria:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "10+2 with 45% marks for Gen/OBC and for SC/ST with 40% marks (Any Stream).",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Course Scope",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "The program prepares you to take up various roles such as:-\n Assistant Manager in Marketing\n Assistant Manager in Finance\n Assistant Manager in HR\n Corporate Sales Manager\n Relationship Manager\n Assistant / Executive in various Management Functions\n Higher Studies (MBA / PGDBM) in Management Domains",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Course Outcomes",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "BBA Program facilitate the young minds with an intellectually stimulating environment to learn the art of business management and leadership. The emerging competitive landscape of business has rendered the need for a new cadre of professionals.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("B.Com (Bachelor of Commerce) Course",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "The B.Com. is a three year annual programme offered by I.P.(P.G.) College Campus-2 Bulandshahr, as a star ranked college of the CCS University Meerut is designed to enable and empower students to acquire the necessary knowledge, skills and abilities to analyse and synthesize the contemporary realities of the domain of business. This programme aims at instilling conceptual and practical understanding to equip students to manage businesses and organisations, and prepares them to drive and face the challenge of tomorrow. It also encourages the students to explore the world of technology and digitization in the relevant field as envisaged by the scholars and policymakers. Further, this course helps in cultivating entrepreneurial mindset and skills.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Subjects You Learn During The Program",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img24.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Eligibility Criteria",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "10+2 with 33% Marks & 5 % extra weightage for commerce stream student.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Course Outcomes",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "The courses of this programme have been designed to promote understanding of the issues in the business world and the economy as a whole. The Programme will help understand the student understand and evaluate various systems, policy frameworks and strategies needed to administer the rapid changes in an organization’s globally oriented environment like equipping students with an understanding of the financial system, its constituents, the principles on which it operates, inter-linkages and regulatory concerns apart from exposure of different functional domains of management.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("M.Com (Masters of Commerce) Course",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Master of Commerce (M.Com.) is a 2-year (4-semester) post-graduate Master's degree which focuses on Commerce, Accounting, Management and Economics related subjects. This course is a smart choice for candidates who wish to make a career in banking, financial services and insurance as well as accounting and commerce sectors. After this two year (Four semester) Post- Graduate Master of Commerce Degree programme will prove as highly qualified for senior positions in business & many areas in the public and private sectors.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Subjects You Learn During The Program",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img25.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Eligibility Criteria",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("BBA/B.Com with 33 % marks in aggregate.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          const footer()
        ])));
  }
}

// Department of Biotechnology...
class Dep_Bio extends StatelessWidget {
  const Dep_Bio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text('I.P. College, Campus-2'),
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
              child: Text("Department of Science\nBiotechnology",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Icon(Icons.compare_arrows, color: Colors.teal[900]),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Biotechnology is an interdisciplinary branch of science which is popular among youngsters as it is providing ample opportunities for those who want to explore the new and modern frontiers of science. It does not refer to a specific industry or job. The applications of Biotechnology are vast as it caters to various industrial sectors like food, textiles, pharmaceutical, agriculture, animal husbandry and more. Biotechnology includes diverse subjects apart from biology making it interdisciplinary. Along with the technical part and engineering applications, biotechnology is giving rise to various new fields with humongous job opportunities.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Objective",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "The program has been designed to bridge the gap between industry requirements and the growing demand for skilled manpower in life science sector. Hands on training in practical techniques, which are being, used commonly like culture methods, biochemical techniques etc. are provided. Students also examine a range of practical applications.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Scope",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Biotechnology has rapidly emerged as an area of having marked impact on almost all domains of human welfare ranging of plant science, food processing, protecting environment, production and proactively trade and economy. Contribution of biotech products to global markets has been around \$100 billion and countries to be on the rise. In India, the demand for such products is of the over \$80 billion. Major demand has been in area of human health, agriculture and industrial products. Projection shows that there will be thousands of unfilled science and technology jobs in these areas of biotechnology.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("B.Sc Biotechnology",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Duration : 3 years\nTotal Seats : 120\nEligibility : 10+2 with 45% marks for Gen./OBC & 40% marks for SC/ST (Bio/Chem./Comp Science/PCB/PCBE/PCMB/PCM/Math/Ag)\nSelection Procedure : The admission to the B.Sc. Biotechnology program will be on the basis of the merit determined by the aggregate marks at (10 + 2) level.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Syllabus of B.Sc Biotechnology",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img26.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("M.Sc Biotechnology",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Duration : 2 years ( 4 Semesters)\nTotal Seats : 60\nEligibility : Bachelor’s degree in Biology (CBZ) / Biotechnology / Microbiology, B.Pharma or B.Tech. Biotechnology or Bachelor’s degree in Laboratory / Medical laboratory techniques with 50% marks.\nSelection Procedure : The admission to the M.Sc. Biotechnology program will be on the basis of the merit determined by the aggregate marks at Graduation level.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Syllabus of M.Sc Biotechnology",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img27.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Programme Outcome",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "* Understand the need and apply knowledge of Biotechnology to solve problems in the areas of Medicine, Agriculture, Fermentation technology, Food processing and Environment, and develop entrepreneurial ideas.\n• Demonstrate proficiency in basic laboratory skills like preparation of solutions and culture media, handling of equipment, aseptic techniques, micropipetting, maintaining scientific laboratory manuals.\n• Perform, and analyze results of experiments using basic laboratory techniques in molecular biology and recombinant DNA technology, like agarose and polyacrylamide gel electrophoresis, restriction enzyme digestion, bacterial transformations and PCR, immunology and plant tissue culture.\n• Ability to present their project work through written, oral, and visual presentations.\n• Exhibit an ability to work independently and collaboratively.\n• Get an exposure in current scientific literature, computer programs and web information pertaining to Biotechnology.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Career opportunities for biotechnologists",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "The domain on which a trained biotechnologist can work is vast. As there are several disciplines involved in biotechnology, there is a great demand for experts in various industries. Biotechnological applications are used widely in the following industries:\n• Healthcare\n• Medicine\n• Pharmaceutical\n• Agriculture\n• Animal husbandry\n• Genetic engineering\n• Environmental conservation\n• Soil biology\n• Ecology\n• Textile industry\n• Cosmetics",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Image.asset('assets/images/img77.jpeg',
              width: double.infinity, fit: BoxFit.cover),
          const footer()
        ])));
  }
}

// Department of B.Sc...
class Dep_BSC extends StatelessWidget {
  const Dep_BSC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: const Text('I.P. College, Campus-2'),
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
              child: Text("Department of Science",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("B.Sc (Bio)- BCZ 'Scope'",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Icon(Icons.compare_arrows, color: Colors.teal[900]),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "B. Sc Biology degree serves as a basis for higher studies in this field such M. Sc and PhD degree in subjects such as Botany, Zoology, Bio-Chemistry, Biotechnology, Food Science, Biomedical Sciences, Genetics, Molecular Biology, Microbiology, Environmental Sciences, Virology, Toxicology etc. The subject also has plenty of opportunities in the field of Research and Development (R&D), Pharmaceuticals and Chemical industries, Public Health and Environmental Protection Sectors, Clinical Research, Waste Management, etc.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Duration : 3 years\nTotal Seats : 60\nEligibility : 10+2 with 33% marks (Biology)\nSelection Procedure : : The admission to the B.Sc. ( Bio) BCZ program will be on the basis of the merit determined by the aggregate marks at 10+2 level.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Syllabus of B.Sc (Bio)- BCZ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img28.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Following are the various Programme Outcomes:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "1. This course forms the basis of science and comprises of the subjects like chemistry, biology, zoology. It helps to develop scientific temper and thus can prove to be more beneficial for the society as the scientific developments can make a nation or society to grow at a rapid pace.\n2. After the completion of this course students have the option to go for higher studies i.e. M. Sc and then do some research for the welfare of mankind.\n3. After higher studies students can join as scientist and can even look for professional job oriented courses.\n4. This course also offers opportunities for serving in Indian Army, Indian Navy, Indian Air Force as officers\n5. Students after this course have the the option to join Indian Civil Services as IAS, IFS etc.\n6. Science graduates can go to serve in industries or may opt for establishing their own industrial unit.\n7. After the completion of the B. Sc degree there are various other options available for the science students. Often, in some reputed universities or colleges in India and abroad the students are recruited directly by big MNC’s after their completion of the course.\n8. Apart from the research jobs, students can also work or get jobs in Marketing, Business & Other technical fields. Science graduates also recruited in the bank sector to work as customer service executives. Students can also find employment in government sectors.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("B. Sc Biology Jobs and career prospects",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Some of the employment areas where you can utilize your talent with a higher degree in Biology are as follows:\n• Agricultural Research Services\n• Biotechnology Firms\n• Botanical Gardens\n• Botanical Survey\n• Broadcast Companies\n• Clinical Research Organizations\n• Colleges/Universities\n• Conservatories\n• Environmental Management and Conservation\n• Farm Management Organizations\n• Fermentation Industries (including Breweries)\n• Fertilizer & Chemicals Plants\n• Food Institutes\n• Plant Genetics\n• Herbal Products Companies\n• Hospitals\n• Plant Genetics Research Centres\n• Research and Development Firms\n• Scientific and Medical Equipment Suppliers\n• Medical Research\n• Medical Laboratories\n• National Parks\n• Pharmaceutical Companies\n• Seed And Nursery Companies\n• Wildlife and Fishery Departments",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("B.Sc (Maths)-PCM",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Bachelor of Science in Mathematics is an undergraduate degree programme that comes under the Science stream. The 3 years B.Sc. degree programme is one of the popular courses that is chosen by students who have an interest in Mathematics subjects. It is an interesting course which is designed to focus on the in-depth topics related to Mathematics. Students who choose B.Sc. Mathematics has good career options. Candidates who have a keen interest in Mathematics subjects can pursue B.Sc. Mathematics course. Students who go for further studies after the completion, of course, have a good career as a Teacher or Assistant Professor in Institute/ Colleges/ Universities.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Scope",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "The demand for the BSc Mathematics graduates is increasing day by day and the graduates can explore a wider career opportunity across different fields. The Banking, Finance, Insurance, Risk Management sector hunt for the qualified graduates in this field who can help in making their business more successful. Pursuing a course in B.Sc Mathematics is useful for the graduates to get lucrative job opportunities that give them a smart salary as well.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Duration : 3 years\nTotal Seats : 60\nEligibility : 10+2 with 33% marks (Eligibility - PCM/PCMB)\nSelection Procedure : The admission to the B.Sc. ( Maths) PCM program will be on the basis of the merit determined by the aggregate marks at 10+2 level.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Syllabus of B. Sc (Maths)",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          Image.asset('assets/images/img29.jpg',
              width: double.infinity, fit: BoxFit.cover),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("Programme Outcomes:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Following are the various programme outcomes:\n1. B.Sc. mathematics student is able to concentrate on Chemistry, Physics, and Mathematics.\n2. Student will demonstrate a scientific knowledge of the core physics principles in Mechanics, Electromagnetism, Modern Physics, and Optics.\n3. He is able to demonstrate basic manipulative skills in algebra, geometry, trigonometry, and beginning calculus.\n4. The student will determine the appropriate level of technology for use in: a) experimental design and implementation, b) analysis of experimental data, and c) numerical and mathematical methods in problem solutions.\n5. He will be able to apply the underlying unifying structures of mathematics (i.e. sets, relations and functions, logical structure) and the relationships among them.\n6. He can investigate and apply mathematical problems and solutions in a variety of contexts related to science, technology, business and industry, and illustrate these solutions using symbolic, numeric, or graphical methods.\n7. The student will acquire knowledge of Chemical Thermodynamics, Kinetics, Electrochemistry, Atomic Structure, Organic Chemistry, Spectroscopy and Skill in Industrial Chemistry.\n8. Student can join Indian Air Force, Indian Navy and can also go for other competitive exams. He can go for higher studies in Mathematics, Chemistry or Physics.\n9. He can join as a scientist in research institutes of immense knowledge having a great scope for growth and development. He can prove to be an asset for the society by producing something more innovative.\n10. Banking sector is another good option for B.Sc Mathematics students.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text("B.Sc Mathematics Jobs and Career Prospects",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[900]),
                  textAlign: TextAlign.center)),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "There are ample opportunities for students who hold a B.Sc. Mathematics degree. The student can pursue higher studies in Mathematics and join as a teacher or professor in top colleges/universities.\nThe lucrative and promising job opportunities available to aspirants of Bachelor of Science [B.Sc] (Mathematics) course are enlisted below:\n• Computer Programmer\n• Demographer\n• Economist\n• Loan Officer\n• Mathematician\n• Researcher & Accountant\n• Statistician\n• Treasury Management Specialist\n• IAS, IPS & PCS Officers\n• Teacher & Tutor",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white))),
          Image.asset('assets/images/img80.jpeg',
              width: double.infinity, fit: BoxFit.cover),
          const footer()
        ])));
  }
}
