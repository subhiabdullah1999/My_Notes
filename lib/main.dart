import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/screens/auth/login_screen.dart';
import 'package:my_notes/screens/auth/siginscreen.dart';

import 'package:my_notes/screens/notesScreens/add_note_screen.dart';
import 'package:my_notes/screens/notesScreens/edit_note_screen.dart';
import 'package:my_notes/screens/notesScreens/notes_home.dart';
import 'package:my_notes/screens/options/app_abut.dart';
import 'package:my_notes/screens/options/develper_screen.dart';
import 'package:my_notes/screens/options/settings_screen.dart';
import 'package:my_notes/screens/splash/splash_screen.dart';

bool? isLogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
  var logInUser = FirebaseAuth.instance.currentUser;
  if (logInUser == null) {
    isLogin = false;
  } else {
    isLogin = true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Notes',
      theme: ThemeData(
        textTheme: TextTheme(
          headline2: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
          headline1: TextStyle(
              color: Colors.green,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
      home: isLogin == false ? splashScreen() : NotesHome(),
      routes: {
        "loginScreen": (context) => LogInScreen(),
        "sigininScreen": (context) => SigInScreen(),
        "noteshome": (context) => NotesHome(),
        "settingScreen": (context) => Settingsscreen(),
        "appAbout": (context) => AppAbout(),
        "developerScreen": (context) => DeveloperScreen(),
        "addnoteScreen": (context) => AddNoteScreen(),
        "editeNoteScreen": (context) => EditNoteScreen(),
      },
    );
  }
}
