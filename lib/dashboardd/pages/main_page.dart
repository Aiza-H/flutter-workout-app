
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:workouttrackerapps/caloriesreq/calculate.dart';
import 'package:workouttrackerapps/exerciselogcrud/app.dart';
import 'package:workouttrackerapps/gymequipment/screens/home.dart';
import 'package:workouttrackerapps/qrcode/qrhomePage.dart';
import 'package:workouttrackerapps/register/views/login_screen.dart';


class MainPage extends StatefulWidget
{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        elevation: 2.0,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        title: Text('Dashboard', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 28.0)),
        actions: <Widget>
        [
          Container
          (
            margin: EdgeInsets.only(right: 8.0),
            child: Row
            (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>
              [
                //Text('Logout', style: TextStyle(color: Colors.grey[50], fontWeight: FontWeight.w700, fontSize: 14.0)),
                  FlatButton(
                  child: Text(
                      'Logout',
                         style: TextStyle(
                         fontSize: 18.0,
                          color: Colors.white,
                          ),
                        ),
                        onPressed: _signOut,
                     ),
                                  
                                ],
                              ),
                            )
                          ],
                        ),
                        body: StaggeredGridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          children: <Widget>[
                            _buildTile(
                              Padding
                              (
                                padding: const EdgeInsets.all(24.0),
                                child: Row
                                (
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>
                                  [
                                    Column
                                    (
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>
                                      [
                                        Text('Choose Your', style: TextStyle(color: Colors.blueAccent)),
                                        Text('\Workout ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25.0))
                                      ],
                                    ),
                                    Material
                                    (
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(24.0),
                                      child: Center
                                      (
                                        child: Padding
                                        (
                                          padding: const EdgeInsets.all(16.0),
                                          child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
                                        )
                                      )
                                    )
                                  ]
                                ),
                              ),
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => Home())),
                            ),
                            // _buildTile(
                            //   Padding(
                            //     padding: const EdgeInsets.all(24.0),
                            //     child: Column
                            //     (
                            //       mainAxisAlignment: MainAxisAlignment.start,
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: <Widget>
                            //       [
                            //         Material
                            //         (
                            //           color: Colors.teal,
                            //           shape: CircleBorder(),
                            //           child: Padding
                            //           (
                            //             padding: const EdgeInsets.all(16.0),
                            //             child: Icon(Icons.account_circle_sharp, color: Colors.white, size: 30.0),
                            //           )
                            //         ),
                            //         Padding(padding: EdgeInsets.only(bottom: 16.0)),
                            //         Text('My Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0)),
                            //         //Text('Update', style: TextStyle(color: Colors.black45)),
                            //       ]
                            //     ),
                            //   ),
                            //   onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => Home())),
                            // ),
                            // _buildTile(
                            //   Padding
                            //   (
                            //     padding: const EdgeInsets.all(24.0),
                            //     child: Column
                            //     (
                            //       mainAxisAlignment: MainAxisAlignment.start,
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: <Widget>
                            //       [
                            //         Material
                            //         (
                            //           color: Colors.amber,
                            //           shape: CircleBorder(),
                            //           child: Padding
                            //           (
                            //             padding: EdgeInsets.all(16.0),
                            //             child: Icon(Icons.qr_code_scanner_outlined, color: Colors.white, size: 30.0),
                            //           )
                            //         ),
                            //         Padding(padding: EdgeInsets.only(bottom: 16.0)),
                            //         Text('Scan QR Code', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0)),
                            //         Text('At Equipment', style: TextStyle(color: Colors.black45)),
                            //       ]
                            //     ),
                            //   ),
                            //   onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomePage())),
                            // ),
                            _buildTile(
                              Padding
                              (
                                padding: const EdgeInsets.all(24.0),
                                child: Row
                                (
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>
                                  [
                                    Column
                                    (
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>
                                      [
                                        Text('Scan QR Code', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0)),
                                        Text('At Equipment', style: TextStyle(color: Colors.amberAccent)),
                                      ],
                                    ),
                                    Material
                                    (
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(24.0),
                                      child: Center
                                      (
                                        child: Padding
                                        (
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(Icons.qr_code_scanner_outlined, color: Colors.white, size: 30.0),
                                        )
                                      )
                                    )
                                  ]
                                ),
                              ),
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomePage())),
                            ),
                            _buildTile(
                              Padding
                              (
                                padding: const EdgeInsets.all(24.0),
                                child: Row
                                (
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>
                                  [
                                    Column
                                    (
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>
                                      [
                                        Text('Keep track your', style: TextStyle(color: Colors.redAccent)),
                                        Text('Daily Activity', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0)),
                                      ],
                                    ),
                                    Material
                                    (
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(24.0),
                                      child: Center
                                      (
                                        child: Padding
                                        (
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(Icons.view_list_outlined, color: Colors.white, size: 30.0),
                                        )
                                      )
                                    )
                                  ]
                                ),
                              ),
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => App())),
                            ),
                            _buildTile(
                              Padding
                              (
                                padding: const EdgeInsets.all(24.0),
                                child: Row
                                (
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>
                                  [
                                    Column
                                    (
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>
                                      [
                                        Text('Calculate Calories', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0)),
                                        Text('Need', style: TextStyle(color: Colors.purple)),
                                      ],
                                    ),
                                    Material
                                    (
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.circular(24.0),
                                      child: Center
                                      (
                                        child: Padding
                                        (
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(Icons.calculate_outlined, color: Colors.white, size: 30.0),
                                        )
                                      )
                                    )
                                  ]
                                ),
                              ),
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => CalcCaloriesReq())),
                            )
                          ],
                          staggeredTiles: [
                            StaggeredTile.extent(2, 120.0),
                            StaggeredTile.extent(2, 120.0),
                            //StaggeredTile.extent(1, 190.0),
                            StaggeredTile.extent(2, 120.0),
                            StaggeredTile.extent(2, 120.0),
                          ],
                        )
                      );
                    }
                  
                    Widget _buildTile(Widget child, {Function() onTap}) {
                      return Material(
                        elevation: 14.0,
                        borderRadius: BorderRadius.circular(12.0),
                        shadowColor: Color(0x802196F3),
                        child: InkWell
                        (
                          // Do onTap() if it isn't null, otherwise do print()
                          onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
                          child: child
                        )
                      );
                    }
        final FirebaseAuth _auth = FirebaseAuth.instance;
        Future<void> _signOut() async {
        await _auth.signOut();
        //Navigator.of(context, rootNavigator: true).pop(context);
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => Login()));
        }

}
                  
