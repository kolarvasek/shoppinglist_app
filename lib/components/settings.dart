import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Drawer(
        width: 200,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios_outlined)),
                    Center(child: Icon(Icons.settings, size: 40)),
                    SizedBox(width: 20),
                    Text('Settings',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500)),
                  ],
                ),
                Divider(color: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
