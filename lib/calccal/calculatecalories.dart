import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalculateCalories extends StatefulWidget {
  @override
  _CalculateCaloriesState createState() => _CalculateCaloriesState();
}

class _CalculateCaloriesState extends State<CalculateCalories> {
  var selectedExercise;

  String _caloriesResult = "";

  final TextEditingController _weightAmount = TextEditingController();
  final TextEditingController _durationRate = TextEditingController();
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        elevation: 0.0,
        backgroundColor: Colors.grey[200],
        leading: IconButton
        (
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text('CALCULATE CALORIES BURNED', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
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
        body: Form(
          key: _formKeyValue,
          autovalidateMode: AutovalidateMode.always,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            children: <Widget>[
              SizedBox(height: 20.0),
              SizedBox(height: 40.0),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("exercise").snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Text("Loading.....");
                    else {
                      List<DropdownMenuItem> exerciseItems = [];
                      for (int i = 0; i < snapshot.data.docs.length; i++) {
                        DocumentSnapshot snap = snapshot.data.docs[i];
                        exerciseItems.add(
                          DropdownMenuItem(
                            child: Text(
                              snap.id,
                              style: TextStyle(color: Color(0xff512da8)),
                            ),
                            value: "${snap.id}",
                          ),
                        );
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(FontAwesomeIcons.calculator,
                              size: 25.0, color: Color(0xff512da8)),
                          SizedBox(width: 50.0),
                          DropdownButton(
                            items: exerciseItems,
                            onChanged: (exerciseValue) {
                              final snackBar = SnackBar(
                                content: Text(
                                  'Selected Exercise value is $exerciseValue',
                                  style: TextStyle(color: Color(0xff512da8)),
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                              setState(() {
                                selectedExercise = exerciseValue;
                              });
                            },
                            value: selectedExercise,
                            isExpanded: false,
                            hint: new Text(
                              "Choose Activity",
                              style: TextStyle(color: Color(0xff512da8)),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
              SizedBox(height: 20.0),
              new TextFormField(
                controller: _weightAmount,
                decoration: const InputDecoration(
                  icon: const Icon(
                    FontAwesomeIcons.star,
                    color: Color(0xff512da8),
                  ),
                  hintText: 'Enter your weight',
                  labelText: 'Weight',
                ),
                keyboardType: TextInputType.number
              ),
              new TextFormField(
                controller: _durationRate,
                decoration: const InputDecoration(
                  icon: const Icon(
                    FontAwesomeIcons.clock,
                    color: Color(0xff512da8),
                  ),
                  hintText: 'Enter activity duration',
                  labelText: 'Duration',
                ),
                keyboardType: TextInputType.number
              ),
              SizedBox(
                height: 80.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                      color: Color(0xff512da8),
                      textColor: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("Calculate", style: TextStyle(fontSize: 18.0)),
                            ],
                          )),
                      onPressed: (){ _handleCalculation();},
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ],
              ),
              caloriesResultsWidget(_caloriesResult)
            ],
          ),
        ));
  }

  void _handleCalculation() {

    //  A = Calories burned
    //  W = Weight
    //  D = Duration

    int A = 0;
    int W = int.parse(_weightAmount.text); 
    int D = int.parse(_durationRate.text);

    A = (W * D );
    
    _caloriesResult = A.toString();

    setState(() {

    });
  }

  Widget caloriesResultsWidget(caloriesResult) {

    bool canShow = false;
    String _caloriesResult = caloriesResult;

    if( _caloriesResult.length > 0 ) {
      canShow = true;
    }
    return
    Container(
      margin: EdgeInsets.only(top: 40.0),
      child: canShow ? Column(
        children: [
          Text("Calories Burned:",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            )
          ),
          Container(
            child: Text(_caloriesResult,
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold
            ))
          )
        ]
      ) : Container()
    );
  }
}