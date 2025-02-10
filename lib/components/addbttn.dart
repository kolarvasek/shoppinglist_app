import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Addbttn extends StatefulWidget {
  final String? uid = FirebaseAuth.instance.currentUser?.uid;

  Future addItem(String item) async {
    await FirebaseFirestore.instance.collection('list').doc(uid).set(
      {
        'items': FieldValue.arrayUnion([item]),
      },
      SetOptions(merge: true),
    );
  }
  @override
  State<Addbttn> createState() => _AddbttnState();
}

class _AddbttnState extends State<Addbttn> {
  void popupwindow() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? newItem;
        return AlertDialog(
          title: Text('Add an item to the list'),
          content: TextField(
            decoration: InputDecoration(
              labelText: 'Item name',
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
                if (newItem != null && newItem!.isNotEmpty) {
                  await widget.addItem(newItem!);
                }
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: popupwindow,
      child: Icon(Icons.add),
    );
  }
}
