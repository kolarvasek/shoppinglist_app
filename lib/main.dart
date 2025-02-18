import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shoppinglist/auth/login_or_register.dart';
import 'package:shoppinglist/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(stream: FirebaseAuth.instance.idTokenChanges(),
       builder: (context, snapshot) {
        if(snapshot.hasData) {
          return const HomePage();
        } else {
          return const LoginOrRegister();
        }
       })
    );
  }
}
