import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Getfood {
  static Future<List<String>> fetchFoodItems() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    final docSnapshot =
        await FirebaseFirestore.instance.collection('list').doc(uid).get();

    if (docSnapshot.data()?['items'] != null) {
      List itemsDynamic = docSnapshot.data()!['items'];
      return itemsDynamic.map(
        (item) => item.toString()).toList();
    }
    return [];
  }
}
