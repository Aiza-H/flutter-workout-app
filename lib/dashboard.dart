import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workouttrackerapps/calccal/calculatecalories.dart';
import 'package:workouttrackerapps/exerciselogcrud/app.dart';
import 'package:workouttrackerapps/newequipment/screens/home.dart';
import 'package:workouttrackerapps/qrcode/qrhomePage.dart';
import 'package:workouttrackerapps/profile.dart';

 
class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
FirebaseAuth _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MENU"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple[900],

        actions: <Widget>[
                    FlatButton(
                      textColor: Colors.white,
                      child: const Text("LOGOUT"),
                       onPressed: () {
                          _signOut().whenComplete(() {
                       Navigator.of(context).pushReplacement(MaterialPageRoute(
                           builder: (context) => CalculateCalories()));
                  });
                },
             )
        ],

        /*leading: GestureDetector(
        onTap: () { /* Write listener code here */ },
        child: Icon(
         Icons.menu,  // add custom icons also
           ),
        ),*/
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: new MaterialButton(
                    height: 100.0,
                    minWidth: 150.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("My Profile"),
                    onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                    )
                    },
                    splashColor: Colors.grey,
                  )),
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: new MaterialButton(
                    height: 100.0,
                    minWidth: 150.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("Workout Suggestion"),
                    onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                    )
                    },
                    splashColor: Colors.redAccent,
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: new MaterialButton(
                    height: 100.0,
                    minWidth: 150.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("Scan QR Code"),
                    onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    )
                    },
                    splashColor: Colors.redAccent,
                  )),
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: new MaterialButton(
                    height: 100.0,
                    minWidth: 150.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("Calculate calories \n\t\t\t\t\t\t\t\t burned"),
                    onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculateCalories()),
                    )
                    },
                    splashColor: Colors.redAccent,
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: new MaterialButton(
                    height: 100.0,
                    minWidth: 150.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: new Text("Activity Log"),
                    onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => App()),
                    )
                    },
                    splashColor: Colors.redAccent,
                  )),
            ],
          ),
        ],
      )),
    );
  }

  Future _signOut() async {
    await _auth.signOut();
  }
}



 