import 'package:flutter/material.dart';
import 'package:social_media/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    title: 'Connect',
    home: RegistrationPage(),
    theme: ThemeData.dark(useMaterial3: true,),
    debugShowCheckedModeBanner: false,
  ));
}

