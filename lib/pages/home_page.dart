// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:animations/animations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/pages/announcement_page.dart';
import 'package:social_media/pages/feed_page.dart';
import 'package:social_media/pages/login_page.dart';
import 'package:social_media/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  logout(BuildContext context) {
    FirebaseAuth.instance.signOut().then(
          (value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LoginPage();
              },
            ),
          ),
        );
  }

  int selectedIndex = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        elevation: 3,
        actions: [
          TextButton.icon(
            onPressed: () {
              logout(context);
            },
            icon: const Icon(Icons.logout_sharp),
            label: const Text('Logout'),
          ),
        ],
      ),
      body: PageTransitionSwitcher(
          transitionBuilder: (child, animation, secondaryAnimation) =>
              FadeThroughTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  child: child),
          child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              children: [
                const FeedPage(),
                const AnnouncementsPage(),
                const ProfilePage()
              ])),

      // body: IndexedStack(
      //   index: selectedIndex,
      //   children: [
      //     const FeedPage(),
      //     const AnnouncementsPage(),
      //     const ProfilePage(),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
            controller.animateToPage(value,
                duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          });
        },
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement_sharp),
            label: 'Announcements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ].map((item) {
          return BottomNavigationBarItem(
              icon: item.icon,
              label: item.label,
              backgroundColor: Colors.white);
        }).toList(),
        currentIndex: selectedIndex,
      ),
    );
  }
}
