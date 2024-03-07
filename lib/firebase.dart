import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media/pages/login_page.dart';
import 'package:social_media/widgets/alert_box.dart';


class FirebaseFunctions {

  static signUp(String email, String password, String name, String contact, String batch, BuildContext context) async {
    if (email == "" || password == "" || name == "" || contact == "" || batch == "") {
      AlertBox.CustomAlertBox(context, 'Enter required fields');
    }
    else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

        // Once the user is registered, save additional data to Firestore
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'name': name,
          'contact': contact,
          'batch': batch,
          'email': email,
        });

        // Navigate to the next screen after successful registration
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        AlertBox.CustomAlertBox(context, e.code.toString());
      }
    }
  }

}