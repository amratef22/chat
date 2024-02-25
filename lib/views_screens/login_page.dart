import 'package:chaty_app/componants/constants.dart';
import 'package:chaty_app/componants/custom_botton.dart';
import 'package:chaty_app/componants/custom_text_field.dart';
import 'package:chaty_app/helper/snak_bar.dart';
import 'package:chaty_app/views_screens/chat_page.dart';
import 'package:chaty_app/views_screens/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

   static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  String? email,password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading=false;



  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
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
                CustomTextFormField(
                  onChange: (data)
                  {
                    email=data;
                  },
                  hint: 'Enter your email',
                  label: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  obsecure: true,
                  onChange: (data)
                  {
                    password=data;
                  },
                  hint: 'Enter your password',
                  label: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onTab: ()
                  async{
                    if (formKey.currentState!.validate())
                    {
                      isLoading =true;
                      setState(() {});
                      try {
                        await loginUser();
                        Navigator.pushNamed(context, ChatScreen.id, arguments: email);
                      } on FirebaseAuthException catch (error)
                      {
                        if (error.code == 'user-not-found')
                        {
                          showSnackBar(context,'No user found for that email.');
                        } else if (error.code == 'wrong-password')
                        {
                          showSnackBar(context,'Wrong password.');
                        }else
                        {
                          showSnackBar(context,'there was an error! please try again.');
                        }
                      }
                      isLoading=false;
                      setState(() {});
                    }
                  },
                  text: 'Login',
                ),

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
                        Navigator.pushNamed(context, RegisterScreen.id,);
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
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user =await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
