import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workouttrackerapps/exerciselogcrud/providers/exercise_provider.dart';
import 'package:workouttrackerapps/exerciselogcrud/screens/home.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExerciseProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          home: HomeScreen(),
          theme: ThemeData(
            accentColor: Colors.pinkAccent,
            primaryColor: Colors.deepPurple[600],
            textTheme: GoogleFonts.hindSiliguriTextTheme(),
          )),
    );
  }
}