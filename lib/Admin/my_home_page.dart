import 'package:bvm_primium_league/Admin/addSchedule.dart';
import 'package:bvm_primium_league/Admin/listview.dart';
import 'package:bvm_primium_league/Admin/live_score.dart';
import 'package:bvm_primium_league/screens/live_score.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'registration_screen.dart';
import 'package:bvm_primium_league/Admin/EditLiveScore.dart';
import 'package:bvm_primium_league/Admin/editRunOfThePlayer.dart';
import 'developer.dart';
import 'package:bvm_primium_league/constants.dart';
import 'package:bvm_primium_league/screens/listview.dart';
import 'package:bvm_primium_league/Admin/schedule.dart';

class MyHomePageAdmin extends StatelessWidget {
  final String title;
  static String id = "My_Home_page_admon";

  MyHomePageAdmin({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(child: Text('This is gonna be Awesome')),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('images/bvm.png'),
              decoration: BoxDecoration(
                //image: Image.asset('bvm.png'),
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text(
                'Player Info',
                style: kSidebarText,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, FlutterTabssAdmin.id);
              },
            ),
            ListTile(
              title: Text(
                'Live Score',
                style: kSidebarText,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, LiveScoreAdmin.id);
              },
            ),
            ListTile(
              title: Text(
                'Live Score Edit',
                style: kSidebarText,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, EditLiveScore.id);
              },
            ),
            ListTile(
              title: Text(
                'Add Schedule',
                style: kSidebarText,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, AddSchedule.id);
              },
            ),
            ListTile(
              title: Text(
                'Update Run',
                style: kSidebarText,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, EditRunOfThePlayer.id);
              },
            ),
            ListTile(
              title: Text(
                'Schedule',
                style: kSidebarText,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, Schedule.id);
              },
            ),
            ListTile(
              title: Text(
                'Signout',
                style: kSidebarText,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Developer',
                style: kSidebarText,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, DeveloperAdmin.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
