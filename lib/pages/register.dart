import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoppinglist/components/submitButton.dart';
import 'package:shoppinglist/components/textField.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  void registerUser() async {
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    if (passwordController.text != confirmPwController.text) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Error"),
          content: Text("Passwords don't match"),
        ),
      );
      return; 
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      String uid = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'username': 'username',
        'email': 'email',
        'createdAt': FieldValue.serverTimestamp(),
      });



      Navigator.pop(context); 
      print("Registered successfully!");
      showDialog(context: context, builder: (context) => AlertDialog(title: const Text("Success"), content: Text("You've been successfully registered"),));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); 
      String errorMessage;

      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = "This email is already in use";
          break;
        case 'weak-password':
          errorMessage = "The password is too weak";
          break;
        case 'invalid-email':
          errorMessage = "Invalid email format";
          break;
        default:
          errorMessage = "An unexpected error occurred";
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: Text(errorMessage),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person, size: 60),
                const SizedBox(height: 30),
                const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 25, letterSpacing: 2),
                ),
                const SizedBox(height: 40),
                MyTextField(
                  controller: usernameController,
                  hintText: "Username",
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: confirmPwController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                MyButton(
                  text: "Submit",
                  onTap: registerUser,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Sign in here',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
