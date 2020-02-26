import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _formKey = GlobalKey<FormState>();
final _firestore = Firestore.instance;
final _firebase = FirebaseAuth.instance;

class InsertUpadtePlayerData extends StatefulWidget {
  static String id = 'InsertUpadtePlayerData';
  InsertUpadtePlayerData({@required this.email, @required this.password});
  final email, password;
  @override
  _InsertUpadtePlayerDataState createState() => _InsertUpadtePlayerDataState();
}

class _InsertUpadtePlayerDataState extends State<InsertUpadtePlayerData> {
  String name,
      DOB,
      team,
      playerType,
      totalRun,
      wicket,
      mobileNo,
      branch,
      teamNameTeam;
  Future<String> _asyncInputDialog(BuildContext context) async {
    String teamName = '';
    return showDialog<String>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter players data'),
          content: Form(
            key: _formKey,
            child: Container(
              height: 300.0,
              width: 150.0,
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(hintText: 'Enter player Date of Birth'),
                    onChanged: (value) {
                      this.DOB = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'Enter player Name'),
                    onChanged: (value) {
                      this.name = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'Enter players team'),
                    onChanged: (value) {
                      this.team = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'Enter player type'),
                    onChanged: (value) {
                      this.playerType = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'Enter player run'),
                    onChanged: (value) {
                      this.totalRun = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(hintText: 'Enter player Wicket'),
                    onChanged: (value) {
                      this.wicket = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(hintText: 'Enter player Mobile No.'),
                    onChanged: (value) {
                      this.mobileNo = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(hintText: 'Enter player branch'),
                    onChanged: (value) {
                      this.branch = value;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Submit'),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  final palyerQueryInfoDelete = await _firestore
                      .collection('playerInfo')
                      .where('email', isEqualTo: widget.email)
                      .getDocuments();
                  for (var deletePlayerInfo
                      in palyerQueryInfoDelete.documents) {
                    print(deletePlayerInfo.documentID);
                    await _firestore
                        .collection('playerInfo')
                        .document(deletePlayerInfo.documentID)
                        .delete();
                    print('deleted');
                  }
                  await _firestore.collection('playerInfo').add({
                    'name': name,
                    'DOB': DOB,
                    'team': team,
                    'player type': playerType,
                    'total run': totalRun,
                    'wicket': wicket,
                    'mobile no': mobileNo,
                    'branch': branch,
                    'email': widget.email,
                    'password': widget.password,
                  });

                  Navigator.pop(context);
                }
                //Navigator.pushNamed(context, playerInfo.id);
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
        title: Text('Player Data'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            color: Colors.lightBlueAccent.shade400,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: 30,
              width: 80,
              child: Text(
                'Signout',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  // backgroundColor: Colors.lightBlueAccent.shade200,
                ),
              ),
            ),
            onPressed: () {
              print('hiii');
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            width: double.infinity,
            height: 50,
            child: FlatButton(
              onLongPress: () {},
              child: Text(
                'Add Data',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onPressed: () {
                _asyncInputDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
