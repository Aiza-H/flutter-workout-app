import 'package:flutter/material.dart';

class CardEquipment extends StatelessWidget {
  CardEquipment({this.image, this.onTap, this.title, this.brand});

  final String image;
  final Function onTap;
  final String title;
  final String brand;

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsets.only(bottom: 15.0),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        splashColor: Colors.deepOrangeAccent.withAlpha(30),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image(
                image: NetworkImage(image),
                width: 150.0,
                height: 130.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(13.0, 12.0, 13.0, 8.0),
              child: Column(
                children: <Widget>[
                  Text(title),
                  SizedBox(height: 10.0),
                  Text(' ' + brand.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}