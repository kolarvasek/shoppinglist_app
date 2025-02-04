import 'package:flutter/material.dart';
import 'package:shoppinglist/components/activeDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.grey[400],
      ),
      endDrawer: Activedrawer(),
    ));
  }
}
