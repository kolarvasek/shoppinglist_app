import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoppinglist/components/submitButton.dart';
import 'package:shoppinglist/components/textField.dart';
import 'package:shoppinglist/pages/home.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      Navigator.pop(context);
      print("Successfully logged in!");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      String errorMessage;

      switch (e.code) {
        case 'wrong-password':
          errorMessage = "Wrong email or password";
          break;
        case 'invalid-email':
          errorMessage = "Invalid email";
          break;
        case 'user-disabled':
          errorMessage = "Your account has been disabled";
          break;
        case 'user-not-found':
          errorMessage = "User doesnt exist";
          break;
        default:
          errorMessage = "An unexpected error has occurred";

          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                  title: const Text('error'), content: Text(errorMessage)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 60,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Sign in',
                  style: TextStyle(fontSize: 25, letterSpacing: 12),
                ),
                SizedBox(
                  height: 40,
                ),
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                  text: "Submit",
                  onTap: loginUser,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Register here',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
    
      );
      }
}
