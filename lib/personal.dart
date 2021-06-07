import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import 'display.dart';

class Personal extends StatefulWidget {
  final String text;
  Personal({Key key, @required this.text}) : super(key: key);
  @override
  _personal createState() => _personal();
}

String s = "";
bool _value = false;

class _personal extends State<Personal> {
  @override
  String s1 = "";
  String cas;
  String id;
  String t = "Next";
  bool valuefirst = false;
  String initValue = "Select your Birth Date";
  bool isDateSelected = false;
  DateTime birthDate; // instance of DateTime
  String birthDateInString;
  List casste = ["General", "BC", "SC", "ST", "OTHER"];
  final _formKey = GlobalKey<FormState>();
  final _fn = TextEditingController();
  final _su = TextEditingController();
  final _mn = TextEditingController();
  final _ad = TextEditingController();
  final pn = TextEditingController();
  final mn = TextEditingController();
  final ta = TextEditingController();
  final pi = TextEditingController();
  final em = TextEditingController();
  final ca = TextEditingController();
  final ph = TextEditingController();
  final dob = TextEditingController();
  String state1;
  List listItem = [
    "Andhra Pradesh",
    "Arunachal Pradesh ",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Lakshadweep",
    "National Capital Territory of Delhi",
    "Puducherry"
  ];

  void dispose() {
    _fn.dispose();
    _su.dispose();
    _mn.dispose();
    _ad.dispose();
    pn.dispose();
    mn.dispose();
    ta.dispose();
    pi.dispose();
    em.dispose();
    ca.dispose();
    ph.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, "");
          },
        ),
        title: Center(
          child: Text("Personal Details"),
        ),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            s = _fn.text +
                "#" +
                _mn.text +
                "#" +
                _su.text +
                "#" +
                s1 +
                "#" +
                cas +
                "#" +
                _ad.text +
                "#" +
                dob.text +
                "#" +
                pn.text +
                "#" +
                mn.text +
                "#" +
                (ta.text + "," + state1 + "-" + pi.text) +
                "#" +
                ph.text +
                "#" +
                em.text +
                "#" +
                widget.text;
            List text = s.split("#");
            if (widget.text == '3') {
              s = _fn.text +
                  "#" +
                  _mn.text +
                  "#" +
                  _su.text +
                  "#" +
                  s1 +
                  "#" +
                  cas +
                  "#" +
                  _ad.text +
                  "#" +
                  dob.text +
                  "#" +
                  pn.text +
                  "#" +
                  mn.text +
                  "#" +
                  (ta.text + "," + state1 + "-" + pi.text) +
                  "#" +
                  ph.text +
                  "#" +
                  em.text +
                  "#";
              Navigator.pop(context, "$s");
            } 
            else {
              if (valuefirst) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        text: text,
                      ),
                    ));
              }
            }
          }
        },
        icon: const Icon(Icons.arrow_forward),
        label: Text(t),
      ),
      extendBodyBehindAppBar: true,
      body: new Container(
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
              SizedBox(height: 40),
              Center(
                child: IconButton(
                  icon: Icon(Icons.account_circle, color: Colors.white),
                  iconSize: 100.0,
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext bc) {
                          return SafeArea(
                            child: Container(
                              child: new Wrap(
                                children: <Widget>[
                                  new ListTile(
                                      leading: new Icon(Icons.photo_library),
                                      title: new Text('Photo Library'),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      }),
                                  new ListTile(
                                    leading: new Icon(Icons.photo_camera),
                                    title: new Text('Camera'),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Candidate Details",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z ]+"),
                          )
                        ],
                        controller: _fn,
                        validator: (value) {
                          if ((!value.isEmpty) && value.length < 6) {
                            return "Enter Correct  Your Name";
                          } else if (value.isEmpty) {
                            return "Enter Correct Your Name";
                          }
                          return null;
                        },
                        style: TextStyle(height: 0.02, color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Fisrt Name",
                          hintText: "Fisrt Name",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z ]+"),
                          )
                        ],
                        controller: _su,
                        validator: (value) {
                          if ((!value.isEmpty) && value.length < 6) {
                            return "Enter Correct   Surname";
                          } else if (value.isEmpty) {
                            return "Enter Correct  Surname";
                          }
                          return null;
                        },
                        style: TextStyle(height: 0.02, color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Surname",
                          hintText: "Surname",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z ]+"),
                          )
                        ],
                        controller: _mn,
                        validator: (value) {
                          if ((!value.isEmpty) && value.length < 6) {
                            return "Enter Correct   Surname";
                          } else if (value.isEmpty) {
                            return "Enter Correct  Surname";
                          }
                          return null;
                        },
                        style: TextStyle(height: 0.02, color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Middle Name",
                          hintText: "Middle Name",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Gender",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                            SizedBox(width: 10),
                            Radio(
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white),
                              focusColor: Colors.white,
                              value: "Male",
                              groupValue: s1,
                              onChanged: (value) {
                                setState(
                                  () {
                                    s1 = value;
                                  },
                                );
                              },
                            ),
                            SizedBox(width: 10),
                            Text("Male", style: TextStyle(color: Colors.white)),
                            Radio(
                              value: "Female",
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white),
                              groupValue: s1,
                              onChanged: (value) {
                                setState(
                                  () {
                                    s1 = value;
                                  },
                                );
                              },
                            ),
                            SizedBox(width: 10),
                            Text("Female",
                                style: TextStyle(color: Colors.white)),
                            Radio(
                              value: "Other",
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white),
                              groupValue: s1,
                              onChanged: (value) {
                                setState(
                                  () {
                                    s1 = value;
                                  },
                                );
                              },
                            ),
                            SizedBox(width: 10),
                            Text("Other",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Date of Birth",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                              child: new Icon(Icons.calendar_today),
                              onTap: () async {
                                final datePick = await showDatePicker(
                                    context: context,
                                    initialDate: new DateTime.now(),
                                    firstDate: new DateTime(1900),
                                    lastDate: new DateTime(2100));
                                if (datePick != null && datePick != birthDate) {
                                  setState(() {
                                    birthDate = datePick;
                                    isDateSelected = true;
                                    birthDateInString =
                                        "${birthDate.day}/${birthDate.month}/${birthDate.year}";
                                    dob.text = birthDateInString;
                                  });
                                }
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z ]+"),
                          )
                        ],
                        controller: dob,
                        validator: (value) {
                          if ((!value.isEmpty) && value.length < 6) {
                            return "Enter Correct Date of Birth";
                          } else if (value.isEmpty) {
                            return "Enter Correct Date OfBirth";
                          }
                          return null;
                        },
                        style: TextStyle(height: 0.02, color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Date of Birth",
                          hintText: "Date of Birth",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[0-9 ]+"),
                          )
                        ],
                        controller: _ad,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter Correct Aadhar Number";
                          } else if (value.length != 12) {
                            return "Entered Aadhar Number is not valid";
                          }
                          return null;
                        },
                        style: TextStyle(height: 0.02, color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Aadhar Number",
                          hintText: "Aadhar Number",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Caste",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          SizedBox(width: 20),
                          DropdownButton(
                            hint: Text("Caste",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                            value: cas,
                            dropdownColor: Colors.black45,
                            onChanged: (newValue) {
                              setState(() {
                                cas = newValue;
                              });
                            },
                            items: casste.map(
                              (valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Family Details",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z. ]+"),
                          )
                        ],
                        controller: pn,
                        validator: (value) {
                          if ((!value.isEmpty) && value.length < 5) {
                            return "Enter Correct Father Name";
                          } else if (value.isEmpty) {
                            return "Enter Correct  Father Name";
                          }
                          return null;
                        },
                        style: TextStyle(height: 0.02, color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Father Name",
                          hintText: "Father Name",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z. ]+"),
                          )
                        ],
                        controller: mn,
                        validator: (value) {
                          if ((!value.isEmpty) && value.length < 5) {
                            return "Enter Correct   Mother Name";
                          } else if (value.isEmpty) {
                            return "Enter Correct  Mother Name";
                          }
                          return null;
                        },
                        style: TextStyle(height: 0.02, color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Mother Name",
                          hintText: "Mother Name",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Address",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z#-/.0-9 ]+"),
                          )
                        ],
                        controller: ta,
                        validator: (value) {
                          if ((!value.isEmpty) && value.length < 6) {
                            return "Enter Correct Address";
                          } else if (value.isEmpty) {
                            return "Enter Correct  Address";
                          }
                          return null;
                        },
                        style: TextStyle(height: 0.02, color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Address",
                          hintText: "Address",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "State",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          SizedBox(width: 10),
                          DropdownButton(
                            hint: Text("Select State",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                            value: state1,
                            dropdownColor: Colors.black45,
                            onChanged: (newValue) {
                              setState(() {
                                state1 = newValue;
                              });
                            },
                            items: listItem.map(
                              (valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[0-9 ]+"),
                          )
                        ],
                        controller: pi,
                        validator: (value) {
                          if ((!value.isEmpty) && value.length != 6) {
                            return "Enter Corrrect Pincode";
                          } else if (value.isEmpty) {
                            return "Enter Correct Pincode";
                          }
                          return null;
                        },
                        style: TextStyle(height: 0.02, color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Pincode",
                          hintText: "Pincode",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Contact Details",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[0-9 ]+"),
                          )
                        ],
                        controller: ph,
                        validator: (value) {
                          if ((!value.isEmpty) && value.length != 10) {
                            return "Enter Correct   Mobile Number";
                          } else if (value.isEmpty) {
                            return "Enter Correct  Mobile Number";
                          }
                          return null;
                        },
                        style: TextStyle(height: 0.02, color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: "Mobile Number",
                          hintText: "Mobile Number",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[a-z.@0-9 ]+"),
                          )
                        ],
                        controller: em,
                        validator: (value) {
                          if (!EmailValidator.validate(value)) {
                            return "Enter Correct Email";
                          } else if (value.isEmpty) {
                            return "Enter Correct  Email";
                          }
                          return null;
                        },
                        style: TextStyle(height: 0.02, color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          labelText: "Email",
                          hintText: "Email",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => _document(),
                                    ));
                                if (c == 4) {
                                  setState(() {
                                    _value = !_value;
                                  });
                                }
                              },
                              child: Text(
                                "Documents to be Uploaded",
                                style: (TextStyle(
                                    fontSize: 20, color: Colors.white)),
                              ),
                            ),
                            SizedBox(width: 15),
                            Visibility(
                              child: Icon(Icons.check_box_rounded),
                              visible: _value,
                            ),
                            SizedBox(width: 25),
                            RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => _document(),
                                      ));
                                  if (c != 4) {
                                    setState(() {
                                      _value = !_value;
                                    });
                                  }
                                },
                                child: Text("Click Here"))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            checkColor: Colors.greenAccent,
                            activeColor: Colors.red,
                            value: this.valuefirst,
                            onChanged: (bool value) {
                              setState(() {
                                this.valuefirst = value;
                              });
                            },
                          ),
                          Text(
                            "I hereby decalre the information given by me are correct",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
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

int c = 5;
bool v1 = true;
bool v2 = true;
bool v3 = true;
bool v4 = true;
bool v5 = true;

class _document extends StatefulWidget {
  document createState() => document();
}

class document extends State<_document> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text("Documents Upload"),
        ),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [Colors.cyan[600], Colors.black26],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 150),
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
                      DataCell(Text('Scanned images of photograph.',
                          style: TextStyle(color: Colors.white))),
                      DataCell(
                          RaisedButton(onPressed: null, child: Text("Upload"))),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Scanned signature.',
                          style: TextStyle(color: Colors.white))),
                      DataCell(
                          RaisedButton(onPressed: null, child: Text("Upload"))),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Caste certificate.',
                          style: TextStyle(color: Colors.white))),
                      DataCell(
                          RaisedButton(onPressed: null, child: Text("Upload"))),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Bachelors & Masters degree with B. Ed.',
                          style: TextStyle(color: Colors.white))),
                      DataCell(
                          RaisedButton(onPressed: null, child: Text("Upload"))),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(
                          'Degree / Diploma certificate in Physical Education.',
                          style: TextStyle(color: Colors.white))),
                      DataCell(
                          RaisedButton(onPressed: null, child: Text("Upload"))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
