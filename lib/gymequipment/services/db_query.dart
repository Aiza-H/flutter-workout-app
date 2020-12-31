import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workouttrackerapps/gymequipment/models/categories.dart';
import 'package:workouttrackerapps/gymequipment/models/equipments.dart';


class DBQuery {
  //Collection Reference (Equipments)
  final CollectionReference _equipmentsCollection =
      FirebaseFirestore.instance.collection('equipment');

  //Collection Reference (Categories)
  final CollectionReference _categoriesCollection =
      FirebaseFirestore.instance.collection('Categories');


  //Get All Equipments Data from Snapshot
  Future<List<Equipments>> equipmentsList(String id) async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('equipment')
          .where('typeid', isEqualTo: id)
          .get();

      return snapshot.docs
          .map(
            (e) => Equipments(
              uid: e.id,
              name: e.get('name') ?? '',
              brand: e.get('brand') ?? '',
              model: e.get('model') ?? '',
              image: e.get('image') ?? '',
              categoryId: e.get('typeid') ?? '',
            ),
          )
          .toList();
    } catch (e) {
      print(e.toString());
    }
  }

  //Get Equipments Data for Recipe Detail
  Future<List<Categories>> getCategoriesForRecipe(String id) async {
    try {
      final QuerySnapshot snapshot =
          await _categoriesCollection.where('id', isEqualTo: id).get();

      return snapshot.docs
          .map(
            (e) => Categories(
              id: e.get('id'),
              name: e.get('category_name'),
            ),
          )
          .toList();
    } catch (e) {
      print(e.toString());
    }
  }

  //Get One Equipments Data from Snapshot
  Future equipmentDetail(String id) async {
    try {
      final DocumentSnapshot snapshot = await _equipmentsCollection.doc(id).get();
      return Equipments(
        uid: id,
        name: snapshot.get('name'),
        brand: snapshot.get('brand'),
        image: snapshot.get('image'),
        model: snapshot.get('model'),
        details: snapshot.get('details'),
        exercise: snapshot.get('exercise'),
        target: snapshot.get('target'),
        categoryId: snapshot.get('typeid'),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}