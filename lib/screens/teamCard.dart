import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bvm_primium_league/StreamBuilderss.dart';
import 'package:bvm_primium_league/screens/listOfPlayerInTeam.dart';

final _firestore = Firestore.instance;

class SingleTeamCard extends StatelessWidget {
  SingleTeamCard({@required this.teamName});
  final String teamName;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100,
      width: double.infinity,
      child: GestureDetector(
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ListOfPlayerInTeam(teamname: teamName);
              },
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(20),
          child: Text(
            '$teamName',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
