import 'package:workouttrackerapps/gymequipment/components/card_category.dart';
import 'package:workouttrackerapps/gymequipment/screens/equipment_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String uid;

  Home({this.uid});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
     return Scaffold
    (
      appBar: AppBar
      (
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
        leading: IconButton
        (
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text('WORKOUT SUGGESTION', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
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
            body: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  thickness: 5.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'WHAT IS YOUR GOAL?',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 15.0,
                ),
                //TODO: Infinite Scrolling
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CardCategory(
                        title: 'GAIN MUSCLE',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EquipmentList(uid: '80jHdlIVvjwWibblN16h'),
                            ),
                          );
                        },
                        image: 'assets/images/strengthsicon.jpg',
                      ),
                      CardCategory(
                        title: 'IMPROVE CARDIO',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EquipmentList(uid: 'P1JwVoyG7NcDlLf3IshW'),
                            ),
                          );
                        },
                        image: 'assets/images/cardiosicon.jpg',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } 
      }
    
