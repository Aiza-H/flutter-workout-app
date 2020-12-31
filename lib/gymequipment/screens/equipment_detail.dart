import 'package:workouttrackerapps/gymequipment/models/equipments.dart';
import 'package:workouttrackerapps/gymequipment/services/db_query.dart';
import 'package:flutter/material.dart';

class EquipmentDetail extends StatefulWidget {
  EquipmentDetail({this.uid});

  final String uid;

  @override
  _EquipmentDetailState createState() => _EquipmentDetailState();
}

class _EquipmentDetailState extends State<EquipmentDetail> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DBQuery().equipmentDetail(widget.uid),
      builder: (context, snapshot) {
        Equipments equipmentDetail = snapshot.data;
        if (snapshot.hasError || !snapshot.hasData) {
          return Container(
            color: Colors.white,
          );
        } else {
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
        title: Text('EXERCISE DETAILS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
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
            body: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 25.0,
                  ),
                  Center(
                    child: Container(
                      height: 250.0,
                      width: 250.0,
                      child: Image(
                        image: NetworkImage(equipmentDetail.image),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 20,
                            left: MediaQuery.of(context).size.width / 20,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              equipmentDetail.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 5.0,
                        // ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 20,
                            top: MediaQuery.of(context).size.height / 50,
                          ),
                          child: Text(
                            'Exercise: ' +
                                equipmentDetail.exercise.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 20,
                            top: MediaQuery.of(context).size.height / 50,
                          ),
                          child: Text(
                            'Target: ' +
                                equipmentDetail.target.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 20,
                            right: MediaQuery.of(context).size.width / 20,
                            top: MediaQuery.of(context).size.height / 50,
                          ),
                          child: Text(
                            'Details: \n' +
                                equipmentDetail.details.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), 
                ],
              ),
            ),
          );
        }
      },
    );
  }
}