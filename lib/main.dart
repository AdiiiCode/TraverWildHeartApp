import 'package:final_project_tourism/HomePage/home.dart';
import 'package:final_project_tourism/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD6MceIzaulRjqVc5JaDkNolnGmJQpmVTE",
  authDomain: "apptourism-ba8d5.firebaseapp.com",
  projectId: "apptourism-ba8d5",
  storageBucket: "apptourism-ba8d5.appspot.com",
  messagingSenderId: "192195426851",
  appId: "1:192195426851:android:6e76b237eac46ffa600f96"
    ),
  );
  runApp(
    
     MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}