import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'personal.dart';
import 'display.dart';

class ed1 {
  String name;
  String cla;
  String per;
  String yearp;
  int ind;
  ed1(this.name, this.cla, this.per, this.yearp, this.ind);
}

class MyHomePage extends StatefulWidget {
  final String text;
  MyHomePage({Key key, @required this.text}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

int c = 0;

class _MyHomePageState extends State<MyHomePage> {
  List<String> ed = ["NA#NA#NA#", "NA#NA#NA#", "NA#NA#NA#", "NA#NA#NA#"];
  List<ed1> items = new List<ed1>();
  _MyHomePageState() {
    items.add(new ed1("X Class Details ", "Name of the School", "X Percentage",
        "Year of Passing", 0));
    items.add(new ed1("XII class Details ", "Name of the College",
        "XII Percentage", "Year of Passing", 1));
    items.add(new ed1("Graduation  Details ", "Name of the College/University",
        "Graduation Percentage", "Year of Passing", 2));
    items.add(new ed1(
        "Post Graduation Details ",
        "Name of the College/University",
        "Post-Graduation Percentage",
        "Year of Passing",
        3));
  }
  String s1 = "";
  String s3;
  String ti = "Next";
  @override
  Widget build(BuildContext context) {
    s3 = widget.text;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, "");
          },
        ),
        title: Center(
          child: Text("Education Details"),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          s1 = s1 + ed[0] + ed[1] + ed[2] + ed[3];
          if (widget.text == "2") {
            s1 = "";
            s1 = s1 + ed[0] + ed[1] + ed[2] + ed[3];
            setState(() {
              ti = "Update";
            });

            Navigator.pop(context, "$s1");
          } else if (widget.text != "2") {
            if (c != 0) {
              s1 = "";
              s1 = s1 + ed[0] + ed[1] + ed[2] + ed[3];
              s1 = widget.text + s1 + "#";
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Personal(
                      text: '$s1',
                    ),
                  ));
            }
            if ("Graduate ".allMatches('$s3').length == 1) {
              print("NA#NA#NA#".allMatches('$s1').length);
              if ("NA#NA#NA#".allMatches('$s1').length < 2) {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Alert Message"),
                      // Retrieve the text which the user has entered by
                      // using the TextEditingController.
                      content: Text("Your are Eligible"),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text('OK'),
                          onPressed: () {
                            setState(() {
                              c = c + 1;
                            });
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  },
                );
              }
            }
            if ("Primary".allMatches('$s3').length == 1) {
              if ("NA#NA#NA#".allMatches('$s1').length < 3) {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Alert Message"),
                      // Retrieve the text which the user has entered by
                      // using the TextEditingController.
                      content: Text("You are Eligible"),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text('OK'),
                          onPressed: () {
                            setState(() {
                              c = c + 1;
                            });
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  },
                );
              }
            }
          }
        },
        icon: const Icon(Icons.arrow_forward),
        label: Text(ti),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(30),
          itemCount: items.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            return new InkWell(
              onTap: () async {
                int c = items[index].ind;
                final s = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyDetailPage(items[index])),
                );
                ed[c] = '$s';
                String s2 = items[index].name + " are  updated ";
                if (s.length == 0) {
                  s2 = "No Details are Updated";
                }
                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text('$s2')));
              },
              child: Hero(
                tag: items[index],
                child: Container(
                  height: 50,
                  color: Colors.black,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, .6),
                          ])),
                      child: Center(
                        child: Text(
                          items[index].name,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class MyDetailPage extends StatefulWidget {
  ed1 _superHero;

  MyDetailPage(ed1 superHero) {
    _superHero = superHero;
  }

  @override
  _MyDetailPageState createState() => _MyDetailPageState(_superHero);
}

class _MyDetailPageState extends State<MyDetailPage> {
  @override
  ed1 superHero;

  _MyDetailPageState(ed1 superHero) {
    this.superHero = superHero;
  }
  final _formKey = GlobalKey<FormState>();
  final _percent = TextEditingController();
  final _school = TextEditingController();
  final _yearof = TextEditingController();
  String s;
  @override
  void dispose() {
    _percent.dispose();
    _yearof.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, "");
          },
        ),
        title: Center(
          child: Text(superHero.name),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            s = _school.text + '#' + _percent.text + '#' + _yearof.text + "#";
            Navigator.pop(context, s);
          }
        },
        icon: const Icon(Icons.arrow_forward),
        label: const Text("Next"),
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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(child:Column(
            children: <Widget>[
              SizedBox(height: 100),
              Center(
                child: IconButton(
                  icon: Icon(Icons.school, color: Colors.white),
                  iconSize: 100.0,
                  onPressed: null,
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z. ]+"))
                  ],
                  controller: _school,
                  validator: (value) {
                    if ((!value.isEmpty) && value.length < 6) {
                      return "Enter Correct " + superHero.cla;
                    } else if (value.isEmpty) {
                      return "Enter Correct " + superHero.cla;
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: superHero.cla,
                    hintText: superHero.cla,
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: new BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _percent,
                  maxLength: 4,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter Correct " + superHero.per;
                    } else {
                      if (value.length == 2) {
                        var myInt = int.parse(value);
                        assert(myInt is int);
                        if (myInt < 50 && !(value.isEmpty)) {
                          return "Enter Correct " + superHero.per;
                        }
                      } else {
                        var myInt = double.parse(value);
                        assert(myInt is double);
                        if (myInt < 50.0 && !(value.isEmpty)) {
                          return "Enter Correct " + superHero.per;
                        }
                      }
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]+"))
                  ],
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: superHero.per,
                    hintText: superHero.per,
                    labelStyle: TextStyle(color: Colors.white),
                    errorStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: new BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _yearof,
                  maxLength: 4,
                  validator: (String value) {
                    if ((!value.isEmpty) && value.length != 4) {
                      return "Enter Correct " + superHero.yearp;
                    } else if (value.isEmpty) {
                      return "Enter Correct " + superHero.yearp;
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]+"))
                  ],
                  decoration: InputDecoration(
                    labelText: superHero.yearp,
                    hintText: superHero.yearp,
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: new BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height:MediaQuery.of(context).size.height/1),
            ],
          ),
        ),),
      ),
    );
  }
}
