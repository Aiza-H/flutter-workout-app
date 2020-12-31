import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:workouttrackerapps/dashboardd/pages/main_page.dart';
import 'package:workouttrackerapps/exerciselogcrud/models/exercise.dart';
import 'package:workouttrackerapps/exerciselogcrud/providers/exercise_provider.dart';
import 'package:workouttrackerapps/exerciselogcrud/screens/exercise.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final exerciseProvider = Provider.of<ExerciseProvider>(context);
    return Scaffold
    (
      appBar: AppBar
      (
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
        leading: IconButton
        (
          color: Colors.black,
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => MainPage())),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text('EXERCISE LOG', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        // actions: <Widget>
        // [
        //   Container
        //   (
        //     margin: EdgeInsets.only(right: 8.0),
        //     child: Row
        //     (
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: <Widget>
        //       [
        //         Text('beclothed.com', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14.0)),
        //         Icon(Icons.arrow_drop_down, color: Colors.black54)
        //       ],
        //     ),
        //   )
        // ],
      ),
      body: StreamBuilder<List<Exercise>>(
          stream: exerciseProvider.entries,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
                      return Text("Loading.....");
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
                              ExerciseScreen(exercise: snapshot.data[index])));
                    },
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ExerciseScreen()));
        },
      ),
    );
  }
}