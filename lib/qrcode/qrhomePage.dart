import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workouttrackerapps/qrcode/generate.dart';
import 'package:workouttrackerapps/qrcode/scan.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        actions: <Widget>[
                    FlatButton(
                      textColor: Colors.white,
                      child: const Text("LOGOUT"),
                       onPressed: () {
                          _signOut().whenComplete(() {
                       Navigator.of(context).pushReplacement(MaterialPageRoute(
                           builder: (context) => MyApp()));
                  });
                },
             )
        ],

      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(image: NetworkImage("https://qfuse.com/blog/wp-content/uploads/2018/07/qr.png")),
            flatButton("Scan QR CODE", ScanPage()),
            SizedBox(height: 20.0,),
            flatButton("Generate QR CODE", GeneratePage()),
          ],
        ),
      ),
    );
  }

  Widget flatButton(String text, Widget widget) {
    return FlatButton(
      padding: EdgeInsets.all(15.0),
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue,width: 3.0),
          borderRadius: BorderRadius.circular(20.0)),
    );
  }

  Future _signOut() async {
    await _auth.signOut();
  }

}