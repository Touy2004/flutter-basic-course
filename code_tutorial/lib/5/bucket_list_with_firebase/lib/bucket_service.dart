import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BucketService extends ChangeNotifier {
  final buckertCollection = FirebaseFirestore.instance.collection('bucket');

  Future<QuerySnapshot> read(String uid) async {
    return buckertCollection.where('uid', isEqualTo: uid).get();
  }

  void create(String uid, String jop) {
    buckertCollection.add({
      'uid': uid,
      'jop': jop,
      'isDone': false,
    });
    notifyListeners();
  }

  void update(String docId, bool isDone) async{
    await buckertCollection.doc(docId).update({'isDone': isDone});
    notifyListeners();
  }

  void delete(String docId) {
    buckertCollection.doc(docId).delete();
    notifyListeners();
  }
}
