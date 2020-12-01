import 'package:workouttrackerapps/newequipment/components/card_equipment.dart';
import 'package:workouttrackerapps/newequipment/models/equipments.dart';
import 'package:workouttrackerapps/newequipment/screens/equipment_detail.dart';
import 'package:workouttrackerapps/newequipment/services/db_query.dart';
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
          return Scaffold(
            appBar: AppBar(
              title: Text('EQUIPMENT TYPE'),
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