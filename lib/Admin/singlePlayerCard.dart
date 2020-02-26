import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bvm_primium_league/Admin/queryPlayerInfo.dart';

final _firestore = Firestore.instance;
TextEditingController nameController,
    DOBController,
    playerTypeController,
    teamNameController,
    totalRunController,
    wicketController,
    mobileNoController,
    branchController;
final _formKey = GlobalKey<FormState>();
class SinglePalyerCardAdmin extends StatelessWidget {
  SinglePalyerCardAdmin({this.branch, this.team, this.name});
  final String name;
  final String team;
  final String branch;
  String DOB, playerType, totalRun, wicket, mobileNo;
  String nameUpdate,
      DOBUpdate,
      teamUpdate,
      playerTypeUpdate,
      totalRunUpdate,
      wicketUpdate,
      mobileNoUpdate,
      branchUpdate;

  void getTextControllerText() async {
    final palyerQueryInfo = await _firestore
        .collection('playerInfo')
        .where('name', isEqualTo: name)
        .getDocuments();

    for (var info in palyerQueryInfo.documents) {
      nameController = TextEditingController(text: name);
      teamNameController = TextEditingController(text: team);
      branchController = TextEditingController(text: branch);
      DOBController = TextEditingController(text: info.data['DOB']);
      playerTypeController =
          TextEditingController(text: info.data['player type']);
      totalRunController = TextEditingController(text: info.data['total run']);
      wicketController = TextEditingController(text: info.data['wicket']);
      mobileNoController = TextEditingController(text: info.data['mobile no']);
      //print(info.data['mobile no']);
    }

//      'name': nameUpdate,
//      'DOB': DOBUpdate,
//      'team': teamUpdate,
//      'player type': playerTypeUpdate,
//      'total run': totalRunUpdate,
//      'wicket': wicketUpdate,
//      'mobile no': mobileNoUpdate,
//      'branch': branchUpdate,
  }

  Future<String> _asyncDeleteDialog(BuildContext context, selectedDocs) async {
    return showDialog<String>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure?? this data will be delete For forever'),
          content: Container(
            height: 20.0,
            width: 150.0,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Yeah Sure'),
              onPressed: () async {
                _firestore
                    .collection('playerInfo')
                    .document(selectedDocs)
                    .delete();
                Navigator.pop(context);
                //Navigator.pushNamed(context, playerInfo.id);
              },
            ),
            FlatButton(
              child: Text('Not sure'),
              onPressed: () async {
                Navigator.pop(context);
                //Navigator.pushNamed(context, playerInfo.id);
              },
            ),
          ],
        );
      },
    );
  }

  Future<String> _asyncUpdateDialog(BuildContext context, selectedDocs) async {
     await getTextControllerText();
    return showDialog<String>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update players data'),
          content: Container(
            height: 300.0,
            width: 150.0,
            child: Form(
              key: _formKey,
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
                    controller: DOBController,
                    decoration:
                        InputDecoration(hintText: 'Enter player Date of Birth'),
                    onChanged: (value) {
                      //value=DOB;
                      DOBUpdate = value;
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
                    controller: nameController,
                    decoration: InputDecoration(hintText: 'Enter player Name'),
                    onChanged: (value) {
                      //value=name;
                      nameUpdate = value;
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
                    controller: teamNameController,
                    decoration: InputDecoration(hintText: 'Enter players team'),
                    onChanged: (value) {
                      //value=team;
                      teamUpdate = value;
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
                    controller: playerTypeController,
                    decoration: InputDecoration(hintText: 'Enter player type'),
                    onChanged: (value) {
                      //value=playerType;
                      playerTypeUpdate = value;
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
                    controller: totalRunController,
                    decoration: InputDecoration(hintText: 'Enter player run'),
                    onChanged: (value) {
                      //value=totalRun;
                      totalRunUpdate = value;
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
                    controller: wicketController,
                    decoration: InputDecoration(hintText: 'Enter player Wicket'),
                    onChanged: (value) {
                      // value=wicket;
                      wicketUpdate = value;
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
                    controller: mobileNoController,
                    decoration:
                        InputDecoration(hintText: 'Enter player Mobile No.'),
                    onChanged: (value) {
                      //value=mobileNo;
                      mobileNoUpdate = value;
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
                    controller: branchController,
                    decoration: InputDecoration(hintText: 'Enter player branch'),
                    onChanged: (value) {
                      //value=name;
                      branchUpdate = value;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Upadate Data'),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  //Scaffold.of(context)
                      //.showSnackBar(SnackBar(content: Text('Processing Data')));


                  await _firestore
                      .collection('playerInfo')
                      .document(selectedDocs)
                      .updateData({
                    'name': nameUpdate,
                    'DOB': DOBUpdate,
                    'team': teamUpdate,
                    'player type': playerTypeUpdate,
                    'total run': totalRunUpdate,
                    'wicket': wicketUpdate,
                    'mobile no': mobileNoUpdate,
                    'branch': branchUpdate,
                  });
                  Navigator.pop(context);
                }//Navigator.pushNamed(context, playerInfo.id);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100,
      width: double.infinity,
      child: GestureDetector(
        onLongPress: () async {
          final palyerQueryInfoDelete = await _firestore
              .collection('playerInfo')
              .where('name', isEqualTo: name)
              .getDocuments();

          for (var deletePlayerInfo in palyerQueryInfoDelete.documents) {
            print(deletePlayerInfo.documentID);
            _asyncDeleteDialog(context, deletePlayerInfo.documentID);
          }
        },
        onDoubleTap: () async {
          final palyerQueryInfo = await _firestore
              .collection('playerInfo')
              .where('name', isEqualTo: name)
              .getDocuments();

          for (var info in palyerQueryInfo.documents) {
            DOB = (info.data['DOB']);
            playerType = (info.data['player type']);
            totalRun = (info.data['total run']);
            wicket = (info.data['wicket']);
            mobileNo = (info.data['mobile no']);
          }
          final palyerQueryInfoupdate = await _firestore
              .collection('playerInfo')
              .where('name', isEqualTo: name)
              .getDocuments();
          for (var update in palyerQueryInfoupdate.documents) {
            print(update.documentID);
            _asyncUpdateDialog(context, update.documentID);
          }
        },
        onTap: () async {
          final palyerQueryInfo = await _firestore
              .collection('playerInfo')
              .where('name', isEqualTo: name)
              .getDocuments();

          for (var info in palyerQueryInfo.documents) {
            DOB = (info.data['DOB']);
            playerType = (info.data['player type']);
            totalRun = (info.data['total run']);
            wicket = (info.data['wicket']);
            mobileNo = (info.data['mobile no']);
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PlayerQueryInfoPageAdmin(
                    totalRun: totalRun,
                    mobileNo: mobileNo,
                    playerType: playerType,
                    DOB: DOB,
                    name: name,
                    team: team,
                    branch: branch,
                    wicket: wicket);
              },
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
// mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                team,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                branch,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
