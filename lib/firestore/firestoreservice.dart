import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workouttrackerapps/firestore/equipment.dart';

final CollectionReference myCollection = FirebaseFirestore.instance.collection('equipment');

class FirestoreService {
  
  Future<Equipment> createTODOEquipment(String name, String brand,String model,String type) async {
      final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(myCollection.doc());

      final Equipment equipment = new Equipment(name,brand,model,type);
      final Map<String, dynamic> data = equipment.toMap();
      tx.set(ds.reference, data);
      return data;
    };

    return FirebaseFirestore.instance.runTransaction(createTransaction).then((mapData) {
      return Equipment.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Stream<QuerySnapshot> getEquipmentList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = myCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }

  
}