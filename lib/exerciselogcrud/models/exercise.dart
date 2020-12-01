import 'package:flutter/material.dart';

class Entry {

  final String exerciseId;
  final String date;
  final String exercise;
  final String level;

  Entry({this.date, this.exercise, this.level, @required this.exerciseId});

  factory Entry.fromJson(Map<String, dynamic> json){
    return Entry(  
      date: json['date'],
      exercise: json['exercise'],
      level: json['level'],
      exerciseId: json['exerciseId']
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'date': date,
      'exercise':exercise,
      'level':level,
      'exerciseId':exerciseId
    };
  }
}