import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workouttrackerapps/dashboard.dart';
import 'equipment.dart';
import 'firestoreservice.dart';

class EquipmentScreen extends StatefulWidget {
  final Equipment equipment;
  EquipmentScreen(this.equipment);
  @override
  _EquipmentScreenState createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  FirestoreService fireServ = new FirestoreService();

  TextEditingController _equipmentNameController;
  TextEditingController _equipmentBrandController;
  TextEditingController _equipmentModelController;
  //TextEditingController _equipmentTypeController;

  int _myEquipmentType = 0;
  String equipmentVal;
  void _handleEquipmentType(int value) {
    setState(() {
      _myEquipmentType = value;
      switch (_myEquipmentType) {
        case 1:
         equipmentVal='Strength';
          break;
        case 2:
           equipmentVal='Cardio';
          break;
        case 3:
           equipmentVal='Weight training';
          break;
        case 4:
           equipmentVal='others';
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _equipmentNameController = new TextEditingController(text: widget.equipment.name);
     _equipmentBrandController = new TextEditingController(text: widget.equipment.brand);
     _equipmentModelController = new TextEditingController(text: widget.equipment.model);
     //_equipmentTypeController = new TextEditingController(text: widget.equipment.type);
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          _myAppBar(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 80,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    controller: _equipmentNameController,
                    decoration: InputDecoration(labelText: "Equipment: "),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    controller: _equipmentBrandController,
                    decoration: InputDecoration(labelText: "Brand: "),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    controller: _equipmentModelController,
                    decoration: InputDecoration(labelText: "Model: "),
                  ),
                ),
                /*Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    controller: _equipmentTypeController,
                    decoration: InputDecoration(labelText: "Type: "),
                  ),
                ),*/
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    'Select Equipment Type:',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _myEquipmentType,
                          onChanged: _handleEquipmentType,
                          activeColor: Color(0xff4158ba),
                        ),
                        Text(
                          'Strength',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 2,
                          groupValue: _myEquipmentType,
                          onChanged: _handleEquipmentType,
                          activeColor: Color(0xfffb537f),
                        ),
                        Text(
                          'Cardio',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 3,
                          groupValue: _myEquipmentType,
                          onChanged: _handleEquipmentType,
                          activeColor: Color(0xff4caf50),
                        ),
                        Text(
                          'Weight training',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 5,
                          groupValue: _myEquipmentType,
                          onChanged: _handleEquipmentType,
                          activeColor: Color(0xff0dc8f5),
                        ),
                        Text(
                          'Others',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        color: Color(0xFFFA7397),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Color(0xFFFDDE42)),
                        )),
                    // This button results in adding the contact to the database
                    RaisedButton(
                        color: Color(0xFFFA7397),
                        onPressed: () {
                          fireServ.createTODOEquipment(_equipmentNameController.text, _equipmentBrandController.text,_equipmentModelController.text,equipmentVal).then((_) {
                           Navigator.pop(context);
                          });
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: Color(0xFFFDDE42)),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _myAppBar() {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin:  Alignment(0.0, 0.0),
            end:  Alignment(1.0, 0.0),
            colors:[
              const Color(0xFFFA7397),
              const Color(0xFFFDDE42),
            ],
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp
            ),
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
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                    }),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Text(
                  'New Equipments',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}