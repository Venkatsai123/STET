import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:data_tables/data_tables.dart';
import 'education.dart';
import 'personal.dart';
import 'display.dart';

void main() {
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
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => login_screen())));
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
  List<Color> colors = [Color(0xFFf4f1de), Color(0xFF14213d)];
  int _index = 0;
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
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
      child: Column(
        children: <Widget>[
          Stack(alignment: Alignment.bottomCenter, children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 15, right: 15, bottom: 20),
                child: Column(
                  children: <Widget>[
                    TextField(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => dis(),
                          ));
                    }),
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
    );
  }

  Widget SignUp(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
      child: SingleChildScrollView(
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
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                  ),
                                  labelText: "Enter Your Email",
                                  labelStyle: TextStyle(color: Colors.black87),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent))),
                            ),
                            Divider(color: Colors.grey, height: 8),
                            TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  ),
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: Colors.black87),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent))),
                            ),
                            Divider(color: Colors.grey, height: 8),
                            TextField(
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
                                          color: Colors.transparent))),
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
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      select_screen()));
                        },
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
                ]),
          ],
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

List l1;

class select_screen extends StatefulWidget {
  @override
  _select_screenstate createState() => _select_screenstate();
}

class _select_screenstate extends State<select_screen> {
  @override
  final double _borderRadius = 24.0;
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text("Post Selection"),
        ),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [Colors.cyan[600], Colors.black26],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              SizedBox(height: 150),
              new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            CategoriesScreen(text: 'Primary teacher')));
                  },
                  child: new Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          'Applying for Primary Teacher ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                        new Text(
                          'Tap here',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            CategoriesScreen(text: 'Graduate teacher-Arts')));
                  },
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          'Applying for Graduate Teacher - Arts ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                        new Text(
                          'Tap here',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => CategoriesScreen(
                            text: 'Graduate Teacher-Science')));
                  },
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          'Applying for Graduate Teacher - Science ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                        new Text('Tap here')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesScreen extends StatefulWidget {
  final String text;

  CategoriesScreen({Key key, this.text}) : super(key: key);

  _CategoriesScreen createState() => new _CategoriesScreen();
}

class _CategoriesScreen extends State<CategoriesScreen> {
  @override
  String s1 = "";
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text("Subject Selection"),
        ),
      ),
      floatingActionButton: Visibility(
        child: FloatingActionButton.extended(
          onPressed: () {
            if (s.length != 0) {
              s1 = s1 + widget.text + "#" + s + "#";

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(text: s1),
                ),
              );
            } else {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Alert Message"),
                    // Retrieve the text which the user has entered by
                    // using the TextEditingController.
                    content: Text("No Language is Selected"),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                },
              );
            }
          },
          icon: const Icon(Icons.arrow_forward),
          label: const Text("Next"),
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(12),
        crossAxisCount: 2,
        children: DUMMY_CATEGORIES
            .map(
              (categoryItem) =>
                  CategoryItem(categoryItem.title, categoryItem.color),
            )
            .toList(),
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 25,
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        s = title;
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text('$title')));
      },
      child: Container(
        height: 200,
        width: 2000,
        padding: const EdgeInsets.all(7),
        child: Center(
          child: Text(title, style: TextStyle(fontSize: 15)),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              //end: Alignment.bottomRight
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

class Category {
  final String id;
  final String title;
  final Color color;
  const Category({this.id, this.title, this.color = Colors.orange});
}

const DUMMY_CATEGORIES = const [
  Category(id: "1", title: "Telugu", color: Colors.green),
  Category(id: "2", title: "English", color: Colors.red),
  Category(id: "3", title: "Hindi", color: Colors.lightBlue),
  Category(id: "4", title: "Science", color: Colors.white),
  Category(id: "5", title: "Social", color: Colors.blue),
  Category(id: "6", title: "Maths", color: Colors.lightGreenAccent),
  Category(id: "7", title: "Sikkim", color: Colors.blueAccent),
  Category(id: "8", title: "Chemistry", color: Colors.tealAccent),
  Category(id: "9", title: "Arts", color: Colors.indigoAccent)
];

class dis extends StatefulWidget {
  _dis createState() => _dis();
}

class _dis extends State<dis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.logout, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [Colors.cyan[600], Colors.black26],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/icon.png',
                  width: 150,
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.account_circle, color: Colors.black),
                  iconSize: 150,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        '',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                  rows: const <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Name Of the Candiadate')),
                        DataCell(Text('Pulivarthi Venkat Sai Krishna')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Registration Number')),
                        DataCell(Text('17121A05H2')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Gender')),
                        DataCell(Text('Male')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Parent details')),
                        DataCell(Text('Pulliah')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Date Of Birth')),
                        DataCell(Text('01/09/1999')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Role')),
                        DataCell(Text('Graduate Teacher')),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => _edits(),
                              ));
                        },
                        color: Colors.white,
                        child: Text("Edit",
                            style: TextStyle(color: Colors.black))),
                    SizedBox(width: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
