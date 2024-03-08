import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/pages/home_page.dart';
import 'package:social_media/pages/login_page.dart';
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
    home: const UserExist(),
    theme: ThemeData.dark(
      useMaterial3: true,
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class UserExist extends StatefulWidget {
  const UserExist({super.key});

  @override
  State<UserExist> createState() => _UserExistState();
}

class _UserExistState extends State<UserExist> {

  @override
  Widget build(BuildContext context) {
    return isUserExist();
  }

  isUserExist() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return LoginPage();
    } else {
      return const HomePage();
    }
  }
}
