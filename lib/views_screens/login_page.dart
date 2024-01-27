import 'package:chaty_app/componants/constants.dart';
import 'package:chaty_app/componants/custom_botton.dart';
import 'package:chaty_app/componants/custom_text_field.dart';
import 'package:chaty_app/views_screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children:
          [
          const SizedBox(
          height: 70,
        ),
            Lottie.asset(
              'assets/images/chat.json',
              width: 120,
              height: 85,
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  'Chaty',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
             CustomTextField(
              hint: 'Enter your email',
              label: 'Email',
            ),
            const SizedBox(
              height: 10,
            ),
             CustomTextField(
              hint: 'Enter your password',
              label: 'Password',
            ),
            const SizedBox(
              height: 20,
            ),
             CustomButton(text: 'Login',),
            const SizedBox(
              height: 8,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                "don't have an account? ",
                        ),
                GestureDetector(
                  onTap: ()
                  {
                    Navigator.pushNamed(context, RegisterScreen.id);
                  },
                  child: const Text(
                    "register ",
                    style: TextStyle(
                        color: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
