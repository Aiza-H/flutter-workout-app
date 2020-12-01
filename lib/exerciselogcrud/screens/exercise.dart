import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:workouttrackerapps/exerciselogcrud/models/exercise.dart';
import 'package:workouttrackerapps/exerciselogcrud/providers/exercise_provider.dart';
import 'package:provider/provider.dart';

class EntryScreen extends StatefulWidget {
  final Entry exercise;

  EntryScreen({this.exercise});

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {

  final exerciseController = TextEditingController();
  final levelController = TextEditingController();

  @override
  void dispose() {
    exerciseController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final exerciseProvider = Provider.of<EntryProvider>(context,listen: false);

    if (widget.exercise != null){
      //Edit
      exerciseController.text = widget.exercise.exercise;
      levelController.text = widget.exercise.level;

      exerciseProvider.loadAll(widget.exercise);
    } else {
      //Add
      exerciseProvider.loadAll(null);
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final exerciseProvider = Provider.of<EntryProvider>(context);
 
    return Scaffold(  
      appBar: AppBar(title: Text(formatDate(exerciseProvider.date, [MM, ' ', d, ', ', yyyy]))
      ,actions: [
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
              onChanged: (String value) => exerciseProvider.changeEntry = value,
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
            RaisedButton(  
              color: Theme.of(context).accentColor,
              child: Text('Save',style: TextStyle(color: Colors.white)),
              onPressed: () {
                exerciseProvider.saveEntry();
                Navigator.of(context).pop();
              },
            ),
            (widget.exercise != null) ? RaisedButton(  
              color: Colors.red,
              child: Text('Delete',style: TextStyle(color: Colors.white)),
              onPressed: () {
                exerciseProvider.removeEntry(widget.exercise.exerciseId);
                Navigator.of(context).pop();
              },
            ): Container(),
          ],
        ),
      ),
    );
  }

   Future<DateTime> _pickDate(BuildContext context, EntryProvider exerciseProvider) async {
    final DateTime picked = await showDatePicker(
      context: context, initialDate: exerciseProvider.date, firstDate: DateTime(2019),
       lastDate: DateTime(2050));

    if (picked != null) return picked;
  }
}