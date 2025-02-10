import 'package:flutter/material.dart';
import 'package:shoppinglist/components/activeDrawer.dart';
import 'package:shoppinglist/components/addbttn.dart';
import 'package:shoppinglist/components/itemlist.dart';

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
            title: Text('Shopping List', style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500
            ),),
            backgroundColor: Colors.grey[400],
          ),
          body: ItemList(),
      endDrawer: Activedrawer(),
      floatingActionButton: Addbttn(),
    ));
  }
}
