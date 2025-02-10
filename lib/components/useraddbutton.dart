import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Useraddbutton extends StatefulWidget {
  @override
  State<Useraddbutton> createState() => _UseraddbuttonState();
}

final List emails = [];

Future setUser(String? newUser) async {
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  await FirebaseFirestore.instance.collection('list').doc(uid).set(
    {
      'users': FieldValue.arrayUnion([newUser]),
    },
    SetOptions(merge: true),
  );
}

class _UseraddbuttonState extends State<Useraddbutton> {
  void popupwindow() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? newItem;
        return AlertDialog(
          title: Text('Add an user to the list'),
          content: TextField(
            decoration: InputDecoration(
              labelText: 'Enter the username you want to add',
            ),
            onChanged: (value) {
              newItem = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                await setUser(newItem);
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FloatingActionButton(
        onPressed: popupwindow,
        child: Icon(Icons.add),
      ),
    );
  }
}
