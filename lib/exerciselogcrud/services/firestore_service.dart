import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workouttrackerapps/exerciselogcrud/models/exercise.dart';

class FirestoreService {
    FirebaseFirestore _db = FirebaseFirestore.instance; 

    //Get Entries
    Stream<List<Exercise>> getEntries(){
      return _db
        .collection('activity')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Exercise.fromJson(doc.data()))
        .toList());
    }

    //Update
    Future<void> setExercise(Exercise exercise){
      var options = SetOptions(merge:true);

      return _db
        .collection('activity')
        .doc(exercise.exerciseId)
        .set(exercise.toMap(),options);
    }

    //Delete
    Future<void> removeExercise(String exerciseId){
      return _db
        .collection('activity')
        .doc(exerciseId)
        .delete();
    }

}