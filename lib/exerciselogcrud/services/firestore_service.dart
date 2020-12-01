import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workouttrackerapps/exerciselogcrud/models/exercise.dart';

class FirestoreService {
    FirebaseFirestore _db = FirebaseFirestore.instance; 

    //Get Entries
    Stream<List<Entry>> getEntries(){
      return _db
        .collection('entries')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Entry.fromJson(doc.data()))
        .toList());
    }

    //Update
    Future<void> setEntry(Entry exercise){
      var options = SetOptions(merge:true);

      return _db
        .collection('entries')
        .doc(exercise.exerciseId)
        .set(exercise.toMap(),options);
    }

    //Delete
    Future<void> removeEntry(String exerciseId){
      return _db
        .collection('entries')
        .doc(exerciseId)
        .delete();
    }

}