import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:workouttrackerapps/exerciselogcrud/models/exercise.dart';
import 'package:workouttrackerapps/exerciselogcrud/providers/exercise_provider.dart';
import 'package:workouttrackerapps/exerciselogcrud/screens/exercise.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final exerciseProvider = Provider.of<EntryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Exercise Log'),
      ),
      body: StreamBuilder<List<Entry>>(
          stream: exerciseProvider.entries,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing:
                        Icon(Icons.edit, color: Theme.of(context).accentColor),
                    title: Text(
                      formatDate(DateTime.parse(snapshot.data[index].date),
                          [MM, ' ', d, ', ', yyyy]),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              EntryScreen(exercise: snapshot.data[index])));
                    },
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EntryScreen()));
        },
      ),
    );
  }
}