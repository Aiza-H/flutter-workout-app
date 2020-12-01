import 'package:workouttrackerapps/newequipment/components/card_category.dart';
import 'package:workouttrackerapps/newequipment/screens/equipment_list.dart';
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
          return Scaffold(
            appBar: AppBar(
              title: Text('CHOOSE WORKOUT TYPE'),
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
                  'CATEGORY LIST',
                  style: TextStyle(
                      fontSize: 20.0,
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
                        title: 'STRENGTH',
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
                        title: 'CARDIO',
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
    
