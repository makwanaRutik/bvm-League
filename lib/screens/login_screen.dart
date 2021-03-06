import 'package:flutter/cupertino.dart';
import 'package:bvm_primium_league/screens/dashboard.dart';
import 'package:bvm_primium_league/screens/live_score.dart';
import 'package:flutter/material.dart';
import 'package:bvm_primium_league/components/rounded_button.dart';
import 'package:bvm_primium_league/screens/my_home_page.dart';
import 'chat_screen.dart';
import 'package:bvm_primium_league/Admin/loginAdmin.dart';
import 'package:bvm_primium_league/player/loginPlayer.dart';
import 'package:bvm_primium_league/screens/registration_screen.dart';
import 'package:bvm_primium_league/screens/registration_screen.dart';
import 'package:bvm_primium_league/screens/developer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:bvm_primium_league/screens/dashboard.dart';
import 'package:bvm_primium_league/constants.dart';
import 'package:bvm_primium_league/screens/listview.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen_id';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final textContollerForEmail=TextEditingController();
  final textContollerForPassword=TextEditingController();
  bool spinnervalue = false;
  Color colour = Colors.white;
  String password, email;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        ' Login',style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spinnervalue,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/bvm.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                controller: textContollerForEmail,
                onChanged: (value) {
                  email = value;
                  // print(value);
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                controller: textContollerForPassword,
                onChanged: (value) {
                  password = value;
                  //print(email);
                },
                decoration: InputDecoration(
                  hintText: 'Enter your password.',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                child: Text(
                  'username or password incorrect',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: colour),
                ),
                height: 24.0,
              ),
              RoundedButton(
                colour: Colors.lightBlueAccent,
                text: 'Log in',
                onPressed: () async {
//              Navigator.pushNamed(context, LiveScore.id);
                  setState(() {
                    spinnervalue = true;
                  });
                  try {
                    //if(email=='RutikJainamKrishna@gmail.com' && password=='W'
                    //  'hooshaa')
                    // final newUser= await _auth.createUserWithEmailAndPassword(email: email, password: password);
                    final newUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, MyHomePage.id);
                    }
                    setState(() {
                      spinnervalue = false;
                    });
                    textContollerForEmail.clear();
                    textContollerForPassword.clear();
//                else
//                  {
//                    print('destroy');
//                  }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              FlatButton(
                child: Text('Don\'t you have an Account...then Register'),
                onPressed: (){
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
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
                'Admin Login',
                style: kSidebarText,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, LoginScreenAdmin.id);
              },
            ),
            ListTile(
              title: Text(
                'Player Login',
                style: kSidebarText,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, LoginScreenPlayer.id);
              },
            ),
            ListTile(
              title: Text(
                'User Login',
                style: kSidebarText,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),

          ],
        ),
      ),
    );
  }
}
