import 'package:workouttrackerapps/gymequipment/components/card_equipment.dart';
import 'package:workouttrackerapps/gymequipment/models/equipments.dart';
import 'package:workouttrackerapps/gymequipment/screens/equipment_detail.dart';
import 'package:workouttrackerapps/gymequipment/services/db_query.dart';
import 'package:flutter/material.dart';

class EquipmentList extends StatefulWidget {
  EquipmentList({this.uid});

  final String uid;

  @override
  _EquipmentListState createState() => _EquipmentListState();
}

class _EquipmentListState extends State<EquipmentList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DBQuery().equipmentsList(widget.uid),
      builder: (context, snapshot) {
        List<Equipments> equipmentList = snapshot.data;
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
        title: Text('GYM EQUIPMENT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
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
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.5),
              ),
              itemCount: equipmentList.length,
              padding: EdgeInsets.all(5.0),
              itemBuilder: (context, index) {
                return CardEquipment(
                  title: equipmentList[index].name,
                  brand: equipmentList[index].brand,
                  image: equipmentList[index].image,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EquipmentDetail(
                          uid: equipmentList[index].uid,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}