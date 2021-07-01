import 'dart:async';
// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:data_tables/data_tables.dart';
import 'package:flutter_application_1/afterSignup.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'education.dart';
import 'personal.dart';
import 'display.dart';
import 'role.dart';
import 'subject.dart';
import 'editspage.dart';
import 'payment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth auth = FirebaseAuth.instance;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'STET',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: splash_screen(),
    );
  }
}

class splash_screen extends StatefulWidget {
  @override
  _flash_screenstate createState() => _flash_screenstate();
}

class _flash_screenstate extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 3000),
        () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return AfterSubmit();
                  } else {
                    return login_screen();
                  }
                },
              );
            })));
  }

  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(children: <Widget>[
          SizedBox(
            height: 90.0,
          ),
          Image.asset(
            'assets/images/icon.png',
            width: 200,
          ),
          Text(
            'STET',
            style: TextStyle(fontSize: 45),
          ),
        ])),
      );
}

class login_screen extends StatefulWidget {
  @override
  login_screenstate createState() => login_screenstate();
}

class login_screenstate extends State<login_screen> {
  List<Color> colors = [Colors.cyan[600], Colors.black26];
  int _index = 0;
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController email1 = new TextEditingController();
  TextEditingController password1 = new TextEditingController();
  TextEditingController cpassword = new TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  void dispose() {
    email.dispose();
    password.dispose();
    email1.dispose();
    password1.dispose();
    cpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Center(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
              Image.asset(
                'assets/images/icon.png',
                width: 200,
              ),
              Tabs(context),
              AnimatedCrossFade(
                firstChild: Login(context),
                secondChild: SignUp(context),
                crossFadeState: _index == 0
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 150),
              )
            ]))),
      ),
    ));
  }

  Widget Login(BuildContext context) {
    var auth = FirebaseAuth.instance;
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
      child: Form(
        key: _formKey1,
        child: Column(
          children: <Widget>[
            Stack(alignment: Alignment.bottomCenter, children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 15, right: 15, bottom: 20),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            labelText: "Enter Your Email",
                            labelStyle: TextStyle(color: Colors.black87),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                      ),
                      Divider(color: Colors.grey, height: 8),
                      TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.black87),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                      ),
                      Divider(
                        color: Colors.transparent,
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 130,
                child: Center(
                  child: GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: colors,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Center(
                            child: Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                      ),
                    ),
                    onTap: () {
                      if (_formKey1.currentState.validate()) {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        auth
                            .signInWithEmailAndPassword(
                                email: email.text, password: password.text)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AfterSubmit(),
                              ));
                        }).catchError(
                          (e) {
                            Fluttertoast.showToast(
                                msg: "Invalid Username or Password");
                            login_screen();
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: GestureDetector(
                child: Center(
                    child: Text(
                  "Forget Password?",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget SignUp(BuildContext context) {
    var auth = FirebaseAuth.instance;
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey2,
          child: Column(
            children: <Widget>[
              Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 15, right: 15, bottom: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              TextField(
                                controller: email1,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.grey,
                                    ),
                                    labelText: "Enter Your Email",
                                    labelStyle:
                                        TextStyle(color: Colors.black87),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent))),
                              ),
                              Divider(color: Colors.grey, height: 8),
                              TextField(
                                controller: password1,
                                obscureText: true,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    ),
                                    labelText: "Password",
                                    labelStyle:
                                        TextStyle(color: Colors.black87),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent))),
                              ),
                              Divider(color: Colors.grey, height: 8),
                              TextField(
                                controller: cpassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  ),
                                  labelText: "Re - Enter Password",
                                  labelStyle: TextStyle(color: Colors.black87),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                ),
                              ),
                              Divider(
                                color: Colors.transparent,
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 190,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            print("insignup");
                            if (_formKey2.currentState.validate()) {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }

                              auth
                                  .createUserWithEmailAndPassword(
                                      email: email1.text,
                                      password: password1.text)
                                  .then((value) => {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        select_screen()))
                                      })
                                  .catchError((e) {
                                print(e.message);
                              });
                            }
                          },
                          child: Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: colors,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Center(
                                    child: Text(
                                  "SIGNUP",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget Tabs(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0, left: 15, right: 15),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.12),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(
                          color:
                              _index == 0 ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Existing",
                          style: TextStyle(
                              color: _index == 0 ? Colors.black : Colors.white,
                              fontSize: 18,
                              fontWeight: _index == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ))),
                  onTap: () {
                    setState(() {
                      _index = 0;
                    });
                  },
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(
                          color:
                              _index == 1 ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "New",
                          style: TextStyle(
                              color: _index == 1 ? Colors.black : Colors.white,
                              fontSize: 18,
                              fontWeight: _index == 1
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ))),
                  onTap: () {
                    setState(() {
                      _index = 1;
                    });
                  },
                ),
              )
            ],
          )),
    );
  }
}
