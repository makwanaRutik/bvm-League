import 'package:bvm_primium_league/screens/live_score.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'registration_screen.dart';
import 'login_screen.dart';
import 'developer.dart';
import 'package:bvm_primium_league/constants.dart';
import 'package:bvm_primium_league/screens/listview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bvm_primium_league/Admin/live_score.dart';
final _auth=FirebaseAuth.instance;
class MyHomePage extends StatelessWidget {
  final String title;
  static String id = "My_Home_page";


  MyHomePage({@required this.title});

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
                Navigator.pushNamed(context, FlutterTabss.id);
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
                'Developer',
                style: kSidebarText,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, Developer.id);
              },
            ),
            ListTile(
              title: Text(
                'Logout',
                style: kSidebarText,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                _auth.signOut();
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
