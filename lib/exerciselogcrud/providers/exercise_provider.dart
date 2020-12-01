import 'package:flutter/material.dart';
import 'package:workouttrackerapps/exerciselogcrud/models/exercise.dart';
import 'package:workouttrackerapps/exerciselogcrud/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class EntryProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  DateTime _date;
  String _exercise;
  String _level;
  String _exerciseId;
  var uuid = Uuid();

  //Getters
  DateTime get date => _date;
  String get exercise => _exercise;
  String get level => _level;
  Stream<List<Entry>> get entries => firestoreService.getEntries();

  //Setters
  set changeDate(DateTime date){
    _date = date;
    notifyListeners();
  }

  set changeEntry(String exercise){
    _exercise = exercise;
    notifyListeners();
  }

  set changeLevel(String level){
    _level = level;
    notifyListeners();
  }

  //Functions
  loadAll(Entry exercise){
    if (exercise != null){
      _date = DateTime.parse(exercise.date);
      _exercise =exercise.exercise;
      _level =exercise.level;
      _exerciseId = exercise.exerciseId;
    } else {
      _date = DateTime.now();
      _exercise = null;
      _level = null;
      _exerciseId = null;
    }
  }

  saveEntry(){
    if (_exerciseId == null){
      //Add
      var newEntry = Entry(date: _date.toIso8601String(), exercise: _exercise, level: _level, exerciseId: uuid.v1());
      print(newEntry.exercise);
      firestoreService.setEntry(newEntry);
    } else {
      //Edit
      var updatedEntry = Entry(date: _date.toIso8601String(), exercise: _exercise, level: _level, exerciseId: _exerciseId);
      firestoreService.setEntry(updatedEntry);
    }
  }

  removeEntry(String exerciseId){
    firestoreService.removeEntry(exerciseId);
  }

}