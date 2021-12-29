import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('story');

class Database {
  static String? userUid;

  static Future<void> addItem({
    required String destination,
    required String city,
    required String description,
    required String price,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "destination": destination,
      "city": city,
      "description": description,
      "price": price,
    };

    await documentReferencer
        .set(data)
        .whenComplete(
            // ignore: avoid_print
            () => print("The course data has been added to the Database"))
        // ignore: avoid_print
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String destination,
    required String city,
    required String description,
    required String price,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "destination": destination,
      "city": city,
      "description": description,
      "price": price,
    };

    await documentReferencer
        .update(data)
        .whenComplete(
            // ignore: avoid_print
            () => print("The course data has been updated to the Database"))
        // ignore: avoid_print
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference storyItemCollection =
        _mainCollection.doc(userUid).collection('items');

    return storyItemCollection.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(
            // ignore: avoid_print
            () => print('The course data has been deleted from the Database'))
        // ignore: avoid_print
        .catchError((e) => print(e));
  }

  read() {}

  void initialise() {}
}
