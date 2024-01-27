import 'package:chaty_app/firebase_options.dart';
import 'package:chaty_app/views_screens/login_page.dart';
import 'package:chaty_app/views_screens/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Chaty());
}

class Chaty extends StatelessWidget {
  Chaty({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'LoginScreen': (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
      },
      initialRoute: 'LoginScreen',
    );
  }
}
