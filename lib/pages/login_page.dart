import 'package:flutter/material.dart';
import 'package:social_media/firebase/firebase_auth.dart';
import 'package:social_media/pages/forgot_password.dart';
import 'package:social_media/pages/register_page.dart';
import 'package:social_media/widgets/text_form_fields.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        elevation: 3,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
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
            CustomTextFormFields(
                label: 'Password',
                controller: passwordController,
                obscureText: true,
                type: TextInputType.text,
                icon: Icons.password),
            SizedBox(
                width: 315,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ));
                      },
                      child: const Text('Forgot Password?'),
                    ))),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: () {
                FirebaseFunctions.signIn(
                  emailController.text,
                  passwordController.text,
                  context,
                );
              },
              icon: const Icon(Icons.login_rounded),
              style: ElevatedButton.styleFrom(
                elevation: 15,
                padding:
                    const EdgeInsets.symmetric(horizontal: 150, vertical: 5),
              ),
              label: const Text(
                'Login',
                style:
                    TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1.4),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(letterSpacing: 1.3),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) {
                        return const RegistrationPage();
                      },
                    ));
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(letterSpacing: 1.3),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
