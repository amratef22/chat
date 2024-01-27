import 'package:chaty_app/componants/constants.dart';
import 'package:chaty_app/componants/custom_botton.dart';
import 'package:chaty_app/componants/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});


  static String id = 'RegisterScreen';
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            const SizedBox(
              height: 150,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create you account',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 120,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign Up',
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
              onChange:(data)
              {
                email=data;
              } ,
              hint: 'Enter your email',
              label: 'Email',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              onChange:(data)
              {
                password=data;
              } ,
              hint: 'Enter your password',
              label: 'Password',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onTab: ()
              async{
               try {
                 await registerUser();
               } on FirebaseAuthException catch (error)
               {
                 if (error.code == 'weak-password')
                 {
                   showSnackBar(context,'The password provided is too weak.');
                 } else if (error.code == 'email-already-in-use')
                 {
                   showSnackBar(context,'email address is already in use by another account');
                 }
               }
              },
              text: 'Register',
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "already have an account? ",
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "login ",
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

  void showSnackBar(BuildContext context, String massege) {
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: Text(massege),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> registerUser() async {
     var auth= FirebaseAuth.instance;
                 UserCredential user =await auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
    );
  }
}
