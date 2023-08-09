// ignore_for_file: deprecated_member_use
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yns_college_management/Utils/provider.dart';
import 'package:yns_college_management/pages/College%20Web/aboutclg_page.dart';
import 'package:yns_college_management/pages/College%20Web/clgweb_page.dart';
import 'package:yns_college_management/pages/College%20Web/notification.dart';
import 'package:yns_college_management/pages/Splash%20Screen/splash_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yns_college_management/Utils/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  //Custom Error Box...
  // /*
  ErrorWidget.builder = ((details) => const Scaffold(
      backgroundColor: Color.fromARGB(255, 77, 182, 172),
      body: Center(
          child: CircularProgressIndicator(
              color: Color.fromARGB(255, 231, 9, 9)))));
  // */

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // initialize app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyB4qgtlot3GgmcyrO4YxoCzSLTMX3qaJIM',
            appId: '1:1022822098505:web:e6e12c5076c933fd708198',
            messagingSenderId: "1022822098505",
            projectId: "college-management-2bb43",
            storageBucket: "college-management-2bb43.appspot.com",
            authDomain: "college-management-2bb43.firebaseapp.com",
            measurementId: "G-ZB9BRK2FLQ"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserProvider(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Clg Management',
            themeMode: ThemeMode.light,
            theme: ThemeData(
                primarySwatch: Colors.teal,
                backgroundColor: Colors.teal[300],
                textTheme: const TextTheme(
                    headline1:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    subtitle1: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic)),
                fontFamily: GoogleFonts.lato().fontFamily),
            darkTheme: ThemeData(brightness: Brightness.dark),
            routes: {
              "/": (context) =>
                  SplashPage(image: Lottie.asset('assets/images/img75.json')),
              // "/": (context) => AddCoursesPage(),
              MyRoutes.ClgWebpageRoute: (context) => const ClgWebPage(),
              MyRoutes.AboutClgpageRoute: (context) => const AboutClgPage(),
              MyRoutes.founderpageRoute: (context) => const AboutFounderPage(),
              MyRoutes.notiRoute: (context) => const NotificationPage()
            }));
  }
}
