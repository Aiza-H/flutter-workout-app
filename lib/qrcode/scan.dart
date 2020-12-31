import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String qrCodeResult = "Not Yet Scanned";
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
        title: Text('SCANNER', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
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
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Result",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              qrCodeResult,
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              onPressed: () async {


                String codeSanner = await BarcodeScanner.scan();    //barcode scnner
                
                    setState(() {
                       qrCodeResult = codeSanner;
                     });
                    checkingValue(codeSanner);
                
                              },
                              child: Text(
                                "Open Scanner",
                                style:
                                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                              ),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.blue, width: 3.0),
                                  borderRadius: BorderRadius.circular(20.0)),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                
                  checkingValue(String url) {
                    if (qrCodeResult != null || qrCodeResult != "") {
                        if (qrCodeResult.contains("https") || qrCodeResult.contains("http")) {
                        return _launchURL(qrCodeResult);
                         } //else {
                    //         Fluttertoast.showToast(
                    //           msg: "Invalide URL", 
                    //           toastLength: Toast.LENGTH_LONG, 
                    //           gravity: ToastGravity.BOTTOM);
                    //     }
                    // } else {
                    //     return null;
                    // }
                    }
                  }

                    _launchURL(String urlQRCode) async {
                      String url = urlQRCode;
                      if (await canLaunch(url)) {
                           await launch(url);
                      }  else {
                            throw 'Could not launch $url';
                        }
                      }

  //its quite simple as that you can use try and catch staatements too for platform exception
}