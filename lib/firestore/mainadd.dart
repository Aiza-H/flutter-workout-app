import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workouttrackerapps/dashboard.dart';
//import 'package:workouttrackerapps/dashboard.dart';
import 'package:workouttrackerapps/firestore/equipment.dart';
//import 'package:workouttrackerapps/firestore/equipmentscreen.dart';
import 'firestoreservice.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Equipment> items;
  FirestoreService fireServ = new FirestoreService();
  StreamSubscription<QuerySnapshot> todoEquipments;

  @override
  void initState() {
    super.initState();

    items=new List();

    todoEquipments?.cancel();
    todoEquipments=fireServ.getEquipmentList().listen((QuerySnapshot snapshot){
        final List<Equipment> equipments=snapshot.docs
        .map((documentSnapshot) => Equipment. fromMap(documentSnapshot.data()))
        .toList();

        setState(() {
        this.items = equipments;
      });
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          _myAppBar(context),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 80,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Stack(children: <Widget>[
                    // The containers in the background
                    Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100.0,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Material(
                              color: Colors.white,
                              elevation: 14.0,
                              shadowColor: Color(0x802196F3),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      todoType('${items[index].brand}'),
                                      Text(
                                        '${items[index].name}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '[${items[index].brand}]',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          /*Text(
                                            '${items[index].brand}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${items[index].model}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0),
                                          ),*/
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ]);
                }),
          ),
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFA7397),
        child: Icon(
          FontAwesomeIcons.listUl,
          color: Color(0xFFFDDE42),
        ),
        onPressed: () {
          //Navigator.push(context,MaterialPageRoute(builder: (context) => EquipmentScreen()),
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EquipmentScreen(Equipment('', '', '', '')),
                fullscreenDialog: true),
          );
        },
      ),*/
    );
  }


  Widget todoType(String icontype) {
    IconData iconval;
    Color colorval;
    switch (icontype) {
      case 'Strength':
        iconval = FontAwesomeIcons.star;
        colorval = Color(0xff4158ba);
        break;
      case 'Cardio':
        iconval = FontAwesomeIcons.star;
        colorval = Color(0xfffb537f);
        break;
      case 'Weight training':
        iconval = FontAwesomeIcons.star;
        colorval = Color(0xff4caf50);
        break;
      default:
         iconval = FontAwesomeIcons.star;
         colorval = Color(0xff0dc8f5);
      //
    }
    return CircleAvatar(
      backgroundColor: colorval,
      child: Icon(iconval, color: Colors.white, size: 20.0),
    );
  }

  Widget _myAppBar(context) {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              const Color(0xFF4A148C),
              const Color(0xFF4A148C),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.white,
                    ),
                    onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                    )
                    },),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Text(
                  'Workout Equipments',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.search,
                      color: Colors.white,
                    ),
                    onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                    )
                    },),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

