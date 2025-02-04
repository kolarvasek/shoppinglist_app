import 'package:flutter/material.dart';

class Peopledrawer extends StatefulWidget {
  const Peopledrawer({super.key});

  @override
  State<Peopledrawer> createState() => _PeopledrawerState();
}

class _PeopledrawerState extends State<Peopledrawer> {

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
                    SizedBox(width: 110),
                    Icon(Icons.people_alt_sharp, size: 40),
                    SizedBox(width: 20),
                    Text('People', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
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
