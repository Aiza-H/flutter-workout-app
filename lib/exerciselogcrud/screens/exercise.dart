import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:workouttrackerapps/exerciselogcrud/models/exercise.dart';
import 'package:workouttrackerapps/exerciselogcrud/providers/exercise_provider.dart';
import 'package:provider/provider.dart';

class ExerciseScreen extends StatefulWidget {
  final Exercise exercise;

  ExerciseScreen({this.exercise});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {

  final exerciseController = TextEditingController();
  final levelController = TextEditingController();
  final setsController = TextEditingController();
  final repsController = TextEditingController();

  @override
  void dispose() {
    exerciseController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final exerciseProvider = Provider.of<ExerciseProvider>(context,listen: false);

    if (widget.exercise != null){
      //Edit
      exerciseController.text = widget.exercise.exercise;
      levelController.text = widget.exercise.level;
      setsController.text = widget.exercise.sets;
      repsController.text = widget.exercise.reps;

      exerciseProvider.loadAll(widget.exercise);
    } else {
      //Add
      exerciseProvider.loadAll(null);
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final exerciseProvider = Provider.of<ExerciseProvider>(context);
 
    return Scaffold(  
      appBar: AppBar(backgroundColor: Colors.deepPurple,title: Text(formatDate(exerciseProvider.date, [MM, ' ', d, ', ', yyyy])),
      actions: [
        IconButton(  
          icon: Icon(Icons.calendar_today),
          onPressed: (){
            _pickDate(context,exerciseProvider).then((value) {
              if (value != null){
                exerciseProvider.changeDate = value;
              }
            });
          },
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(  
          children: [
            TextField(  
              decoration: InputDecoration(  
                labelText: 'Exercise Activity', border: InputBorder.none,
              ),
              maxLines: 3,
              minLines: 1,
              onChanged: (String value) => exerciseProvider.changeExercise = value,
              controller: exerciseController,
            ),
            TextField(  
              decoration: InputDecoration(  
                labelText: 'Level', border: InputBorder.none,
              ),
              maxLines: 3,
              minLines: 1,
              onChanged: (String value) => exerciseProvider.changeLevel = value,
              controller: levelController,
            ),
            TextField(  
              decoration: InputDecoration(  
                labelText: 'Sets', border: InputBorder.none,
              ),
              maxLines: 3,
              minLines: 1,
              onChanged: (String value) => exerciseProvider.changeSets = value,
              controller: setsController,
            ),
            TextField(  
              decoration: InputDecoration(  
                labelText: 'Reps', border: InputBorder.none,
              ),
              maxLines: 3,
              minLines: 1,
              onChanged: (String value) => exerciseProvider.changeReps = value,
              controller: repsController,
            ),
            RaisedButton(  
              color: Theme.of(context).accentColor,
              child: Text('Save',style: TextStyle(color: Colors.white)),
              onPressed: () {
                exerciseProvider.saveExercise();
                Navigator.of(context).pop();
              },
            ),
            (widget.exercise != null) ? RaisedButton(  
              color: Colors.red,
              child: Text('Delete',style: TextStyle(color: Colors.white)),
              onPressed: () {
                exerciseProvider.removeExercise(widget.exercise.exerciseId);
                Navigator.of(context).pop();
              },
            ): Container(),
          ],
        ),
      ),
    );
  }

   Future<DateTime> _pickDate(BuildContext context, ExerciseProvider exerciseProvider) async {
    final DateTime picked = await showDatePicker(
      context: context, initialDate: exerciseProvider.date, firstDate: DateTime(2019),
       lastDate: DateTime(2050));

    if (picked != null) return picked;
  }
}