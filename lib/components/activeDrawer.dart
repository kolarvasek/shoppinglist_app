import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoppinglist/auth/login_or_register.dart';
import 'package:shoppinglist/components/peopleDrawer.dart';

class Activedrawer extends StatefulWidget {
  const Activedrawer({super.key});

  @override
  State<Activedrawer> createState() => _ActivedrawerState();
}

class _ActivedrawerState extends State<Activedrawer> {
    void signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginOrRegister()));
  }
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Drawer(
        width: 350,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.person, size: 50),
                    SizedBox(width: 70),
                    Text('Username', style: TextStyle(fontSize: 20)),
                  ],
                ),
                Divider(color: Colors.black),

                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('People', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Peopledrawer()));
                  },
                ),

                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  onTap: () {
                    /////
                  },
                ),

                Expanded(child: Container()),

                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                  onTap: signOut,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}