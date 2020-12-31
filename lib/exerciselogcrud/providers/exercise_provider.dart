import 'package:flutter/material.dart';
import 'package:workouttrackerapps/exerciselogcrud/models/exercise.dart';
import 'package:workouttrackerapps/exerciselogcrud/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class ExerciseProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  DateTime _date;
  String _exercise;
  String _level;
  String _sets;
  String _reps;
  String _exerciseId;
  var uuid = Uuid();

  //Getters
  DateTime get date => _date;
  String get exercise => _exercise;
  String get level => _level;
  String get sets => _sets;
  String get reps => _reps;
  Stream<List<Exercise>> get entries => firestoreService.getEntries();

  //Setters
  set changeDate(DateTime date){
    _date = date;
    notifyListeners();
  }

  set changeExercise(String exercise){
    _exercise = exercise;
    notifyListeners();
  }

  set changeLevel(String level){
    _level = level;
    notifyListeners();
  }

  set changeSets(String sets){
    _sets = sets;
    notifyListeners();
  }

  set changeReps(String reps){
    _reps = reps;
    notifyListeners();
  }

  //Functions
  loadAll(Exercise exercise){
    if (exercise != null){
      _date = DateTime.parse(exercise.date);
      _exercise =exercise.exercise;
      _level =exercise.level;
      _sets =exercise.sets;
      _reps =exercise.reps;
      _exerciseId = exercise.exerciseId;
    } else {
      _date = DateTime.now();
      _exercise = null;
      _level = null;
      _sets = null;
      _reps = null;
      _exerciseId = null;
    }
  }

  saveExercise(){
    if (_exerciseId == null){
      //Add
      var newExercise = Exercise(date: _date.toIso8601String(), exercise: _exercise, level: _level, sets: _sets, reps: _reps,exerciseId: uuid.v1());
      print(newExercise.exercise);
      firestoreService.setExercise(newExercise);
    } else {
      //Update
      var updatedExercise = Exercise(date: _date.toIso8601String(), exercise: _exercise, level: _level, sets: _sets, reps: _reps, exerciseId: _exerciseId);
      firestoreService.setExercise(updatedExercise);
    }
  }

  removeExercise(String exerciseId){
    firestoreService.removeExercise(exerciseId);
  }

}