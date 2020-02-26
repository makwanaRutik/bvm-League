import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bvm_primium_league/screens/queryPlayerInfo.dart';

final _firestore = Firestore.instance;

class SinglePalyerCard extends StatelessWidget {
  SinglePalyerCard({this.branch, this.team, this.name});
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100,
      width: double.infinity,
      child: GestureDetector(

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
                return PlayerQueryInfoPage(
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

