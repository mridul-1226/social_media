import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media/pages/home_page.dart';
import 'package:social_media/pages/login_page.dart';
import 'package:social_media/widgets/alert_box.dart';


class FirebaseFunctions {

  static signUp(String email, String password, String name, String contact, String batch, BuildContext context) async {
    if (email == "" || password == "" || name == "" || contact == "" || batch == "") {
      AlertBox.CustomAlertBox(context, 'Enter required fields', 'Please enter all the required details');
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
        AlertBox.CustomAlertBox(context, 'Error while Signing Up', e.message.toString());
      }
    }
  }

  static signIn(String email, String password, BuildContext context) async {
    UserCredential? userCredential;
    if(email.isEmpty || password.isEmpty){
      AlertBox.CustomAlertBox(context, 'Enter required fields', 'Please enter all the required details');
    }
    else{
      try{
        userCredential =await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage())));
      }

      on FirebaseAuthException catch(e){
        AlertBox.CustomAlertBox(context, 'Error while Signing In', e.message.toString());
      }
    }
  }

}