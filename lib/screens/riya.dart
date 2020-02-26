import 'package:flutter/material.dart';

class Riya extends StatefulWidget {
  static String id='riya';
  @override
  _RiyaState createState() => _RiyaState();
}

class _RiyaState extends State<Riya> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/m2.jpg"),
                  radius: 50.0,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey,),
                  focusedBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.grey),),
                ),
              ),
              SizedBox( height: 20 ,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey,),
                  focusedBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.grey),),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment(0.8,0.5),
                child: InkWell(
                  child: Text(
                    "Forgot Password",
                    style: TextStyle( fontSize: 18.0,
                      decoration: TextDecoration.underline,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              RaisedButton(
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                color: Colors.green[800],
                onPressed: (){},
                hoverColor: Colors.green,
                elevation: 10,
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment(1.5,0.5),
                width: 280,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 25,),
                    child: Row(
                      children: <Widget>[
                        ImageIcon(
                          AssetImage("images/google.png",),
                          size: 25,
                        ),
                        SizedBox(width: 10,),
                        Text("Log in with Google", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                alignment: Alignment(1.5,0.5),
                width: 280,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Padding(
                    padding:EdgeInsets.only(left:25.0),
                    child: Row(
                      children: <Widget>[
                        ImageIcon(
                          AssetImage("images/google.png",),
                          size: 25,
                        ),
                        SizedBox(width: 10,),
                        Text("Log in with Facebook", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "New User?",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: InkWell(
                      child: Text(
                        "Sign Up",
                        style: TextStyle( fontSize: 18.0,
                          decoration: TextDecoration.underline,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),),
    );
  }
}
