import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/widgets/alert_box.dart';
import 'package:social_media/widgets/text_form_fields.dart';

class ForgotPassword extends StatelessWidget {

  TextEditingController emailController = TextEditingController();


  forgotPassword(String email) async{
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
        elevation: 3,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormFields(
                label: 'Email',
                controller: emailController,
                obscureText: false,
                type: TextInputType.emailAddress,
                icon: Icons.email_sharp),
            const SizedBox(height: 24,),
            ElevatedButton.icon(
              onPressed: () {
                if(emailController.text !=null){
                  forgotPassword(emailController.text);
                  AlertBox.CustomAlertBox(context, 'Email sent', 'Password reset mail sent to ${emailController.text}');
                }
                else{
                  AlertBox.CustomAlertBox(context, 'E-mail can\'t be null', 'Enter your registered E-mail');
                }
              },
              icon: const Icon(Icons.login_rounded),
              style: ElevatedButton.styleFrom(
                elevation: 15,
                padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 5),
              ),
              label: const Text(
                'Get Password Reset Link',
                style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
