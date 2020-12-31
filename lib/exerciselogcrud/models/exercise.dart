import 'package:flutter/material.dart';

class Exercise {

  final String exerciseId;
  final String date;
  final String exercise;
  final String level;
  final String sets;
  final String reps;

  Exercise({this.date, this.exercise, this.level, this.sets, this.reps, @required this.exerciseId});

  factory Exercise.fromJson(Map<String, dynamic> json){
    return Exercise(  
      date: json['date'],
      exercise: json['exercise'],
      level: json['level'],
      sets: json['sets'],
      reps: json['reps'],
      exerciseId: json['exerciseId']
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'date': date,
      'exercise':exercise,
      'level':level,
      'sets':sets,
      'reps':reps,
      'exerciseId':exerciseId
    };
  }
}