import 'package:flutter/material.dart';
import 'dart:async';

class CalcCaloriesReq extends StatefulWidget {
  @override
  _CalcCaloriesReqState createState() => new _CalcCaloriesReqState();
}

class _CalcCaloriesReqState extends State<CalcCaloriesReq> {
  int bmr;
  int caloriesNeed;
  int radioSelected;
  double weight;
  double age;
  bool genre = false;
  double height = 170.0;
  Map mapActivite = {
    0: "Low",
    1: "Moderate",
    2: "Strong"
  };

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(new FocusNode())),
      child: new Scaffold(
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
        title: Text('CALCULATE CALORIES', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
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
        body: new SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              padding(),
              texteAvecStyle("Fill in all the fields to get your daily calorie requirement"),
              padding(),
              new Card(
                elevation: 10.0,
                child: new Column(
                  children: <Widget>[
                    padding(),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        texteAvecStyle("Women", color: Colors.pink),
                        new Switch(
                            value: genre,
                            inactiveTrackColor: Colors.pink,
                            activeTrackColor: Colors.blue,
                            onChanged: (bool b) {
                              setState(() {
                                genre = b;
                              });
                            }),
                        texteAvecStyle("Man", color: Colors.blue)
                      ],
                    ),
                    padding(),
                    new RaisedButton(
                      color: setColor(),
                      child: texteAvecStyle((age == null)? "Press to select your age": "Your age is : ${age.toInt()}",
                        color: Colors.white
                      ),
                        onPressed: (() => montrerPicker())
                    ),
                    padding(),
                    texteAvecStyle("Your height is: ${height.toInt()} cm.", color: setColor()),
                    padding(),
                    new Slider(
                        value: height,
                        activeColor: setColor(),
                        onChanged: (double d) {
                          setState(() {
                            height = d;
                          });
                        },
                      max: 215.0,
                      min: 100.0,
                    ),
                    padding(),
                    new TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (String string) {
                        setState(() {
                          weight = double.tryParse(string);
                        });
                      },
                      decoration: new InputDecoration(
                        labelText: " Enter your weight in kg."
                      ),
                    ),
                    padding(),
                    texteAvecStyle("What is your sport activity level?", color: setColor()),
                    padding(),
                    rowRadio(),
                    padding()
                  ],
                ),
              ),
              padding(),
              new RaisedButton(
                color: setColor(),
                child: texteAvecStyle("Calculate", color: Colors.white),
                  onPressed: calculateNumberOfCalories,
              )
            ],
          ),
        ),
      ),
    );


  }


  Padding padding() {
    return new Padding(padding: EdgeInsets.only(top: 20.0));
  }

  Future<Null> montrerPicker() async {
    DateTime choice = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now(),
      initialDatePickerMode: DatePickerMode.year
    );
    if (choice != null) {
      var difference = new DateTime.now().difference(choice);
      var days = difference.inDays;
      var ans = (days / 365);
      setState(() {
        age = ans;
      });
    }
  }


  Color setColor() {
    if (genre) {
      return Colors.blue;
    } else {
      return Colors.pink;
    }
  }
  
  Text texteAvecStyle(String data, {color: Colors.black, fontSize: 15.0}) {
    return new Text(
      data,
      textAlign: TextAlign.center,
      style: new TextStyle(
        color: color,
        fontSize: fontSize
      )
    );
  }
  
  Row rowRadio() {
    List<Widget> l = [];
    mapActivite.forEach((key, value) {
      Column colonne = new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Radio(
            activeColor: setColor(),
              value: key,
              groupValue: radioSelected, 
              onChanged: (Object i) {
              setState(() {
                radioSelected = i;

              });
              }),
          texteAvecStyle(value, color: setColor())
        ],
      );
      l.add(colonne);
    });
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: l,
    );
  }

  void calculateNumberOfCalories() {
    if (age != null && weight != null && radioSelected != null) {
      //CalculerradioSelected
      if (genre) {
        bmr = (66.47 + (13.75 * weight) + (5.00 * height) - (6.75 * age)).toInt();
      } else {
        bmr = (655.09 + (9.56 * weight) + (1.84 * height) - (4.67 * age)).toInt();
      }
      switch(radioSelected) {
        case 0:
          caloriesNeed = (bmr * 1.2).toInt();
          break;
        case 1:
          caloriesNeed = (bmr * 1.5).toInt();
          break;
        case 2:
          caloriesNeed = (bmr * 1.8).toInt();
          break;
        default:
          caloriesNeed = bmr;
          break;
      }

      setState(() {
        dialogue();
      });

    } else {
      alerte();
    }
  }

  Future<Null> dialogue() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return SimpleDialog(
            title: texteAvecStyle("Your calorie requirement", color: setColor()),
            contentPadding: EdgeInsets.all(15.0),
            children: <Widget>[
              padding(),
              texteAvecStyle("Your basal metabolic rate (BMR) : $bmr"),
              padding(),
              texteAvecStyle("Total daily calorie requirement : $caloriesNeed  calories"),
              new RaisedButton(onPressed: () {
                Navigator.pop(buildContext);
              },
              child: texteAvecStyle("OK", color: Colors.white),
                color: setColor(),
              )
            ],
          );
        }
    );
  }

  Future<Null> alerte() async {
    return showDialog(
        context: context,
      barrierDismissible: false,
      builder: (BuildContext buildContext) {
          return new AlertDialog(
            title: texteAvecStyle("Error"),
            content: texteAvecStyle("All fields are not filled"),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(buildContext);
                  },
                  child: texteAvecStyle("OK", color: Colors.red))
            ],
          );
      }
    );
  }
}