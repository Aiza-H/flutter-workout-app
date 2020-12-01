import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.purple[900]
        
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Dashboard'),
        ),
      ),
    );
  }
}