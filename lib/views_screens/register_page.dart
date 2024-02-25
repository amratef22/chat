import 'package:chaty_app/componants/constants.dart';
import 'package:chaty_app/componants/custom_botton.dart';
import 'package:chaty_app/componants/custom_text_field.dart';
import 'package:chaty_app/helper/snak_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key});


  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;

  String? password;

  GlobalKey<FormState> formkey = GlobalKey();

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formkey,
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
                CustomTextFormField(
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
                CustomTextFormField(
                  onChange:(data)
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
                   if (formkey.currentState!.validate())
                   {
                     isLoading =true;
                     setState(() {});
                     try {
                       await registerUser();
                       Navigator.pop(context);
                     } on FirebaseAuthException catch (error)
                     {
                       if (error.code == 'weak-password')
                       {
                         showSnackBar(context,'The password provided is too weak');
                       } else if (error.code == 'email-already-in-use')
                       {
                         showSnackBar(context,'email address is already in use by another account');
                       }
                     }
                     isLoading=false;
                     setState(() {});
                   }else
                   {

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
        ),
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
