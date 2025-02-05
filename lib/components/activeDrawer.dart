import 'package:cloud_firestore/cloud_firestore.dart';
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
    if (context.mounted) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginOrRegister()));
    }
  }

  String? uid = FirebaseAuth.instance.currentUser?.uid;

  Future getUsername() async {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (userDoc.exists) {
      return userDoc['username'];
    } else {
      return null;
    }
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
                Stack(
                  children: [
                    Center(
                      child: FutureBuilder(
                        future: getUsername(),
                        builder: (context, snapshot) {
                          final username =
                              snapshot.hasData ? snapshot.data : 'Username';
                          return Text(
                            username,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Icon(Icons.person, size: 50),
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.black),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text('People',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  onTap: () {
                    if (context.mounted) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Peopledrawer()));
                    }
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  onTap: () {
                    /////
                  },
                ),
                Expanded(child: Container()),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
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
