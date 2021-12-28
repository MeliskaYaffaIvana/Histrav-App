import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class Database {
  late FirebaseFirestore firestore;
  initialise() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(String destination, String city) async {
    try {
      await firestore.collection("story").add({
        'destination': destination,
        'city': city,
        'storyImage': FileImage,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection("story").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot =
          await firestore.collection('story').orderBy('storyImage').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "destination": doc['destination'],
            "city": doc["city"]
          };
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(String id, String destination, String city) async {
    try {
      await firestore
          .collection("story")
          .doc(id)
          .update({'destination': destination, 'city': city});
    } catch (e) {
      print(e);
    }
  }
}
