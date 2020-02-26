import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bvm_primium_league/Admin/playerInfo.dart';

class AddPlayerAdmin extends StatefulWidget {
  static String id = 'palyer id Admin';
  @override
  _AddPlayerAdminState createState() => _AddPlayerAdminState();
}

class _AddPlayerAdminState extends State<AddPlayerAdmin> {
  final _firestore = Firestore.instance;
  String name, DOB, team, playerType, totalRun, wicket, mobileNo, branch;
  Future<String> _asyncInputDialog(BuildContext context) async {
    String teamName = '';
    return showDialog<String>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter players data'),
          content: Container(
            height: 300.0,
            width: 150.0,
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration:
                      InputDecoration(hintText: 'Enter player Date of Birth'),
                  onChanged: (value) {
                    this.DOB = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter player Name'),
                  onChanged: (value) {
                    this.name = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter players team'),
                  onChanged: (value) {
                    this.team = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter player type'),
                  onChanged: (value) {
                    this.playerType = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter player run'),
                  onChanged: (value) {
                    this.totalRun = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter player Wicket'),
                  onChanged: (value) {
                    this.wicket = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration:
                      InputDecoration(hintText: 'Enter player Mobile No.'),
                  onChanged: (value) {
                    this.mobileNo = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter player branch'),
                  onChanged: (value) {
                    this.branch = value;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Submit'),
              onPressed: () async{
                await _firestore.collection('playerInfo').add({
                  'name': name,
                  'DOB': DOB,
                  'team': team,
                  'player type': playerType,
                  'total run': totalRun,
                  'wicket': wicket,
                  'mobile no': mobileNo,
                  'branch': branch,
                });
                Navigator.pushNamed(context, playerInfoAdmin.id);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('players'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _asyncInputDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
