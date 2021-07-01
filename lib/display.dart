import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'afterSignup.dart';
import 'editspage.dart';
import 'main.dart';
import 'personal.dart';
import 'education.dart';


class DetailsPage extends StatefulWidget {
  final List text;
  DetailsPage({Key key, this.text}) : super(key: key);
  _DetailsPage createState() => _DetailsPage();
}

List l;
int c = 0;
List l1 = [
  "First Name",
  "Middle Name",
  "Sur Name",
  "Gender",
  "Caste",
  "Aadhar Number",
  "Date of Birth",
  "Father Name",
  "Mother Name",
  "Address",
  "State",
  "Pincode",
  "Mobile Number",
  "EMail",
  "Role",
  "Subject",
  "Name of the School",
  "Xth Percentage",
  "Xth Passing Year",
  "Name of the College",
  "XIIth Percentage",
  "XIIth Passing Year",
  "Name of the College/University",
  "Graduation Percentage",
  "Graduation Passing Year",
  "Name of the University",
  "Post Graduation Percentage",
  "Post Graduation Passing Year",
  "Payment Status"
];

class _DetailsPage extends State<DetailsPage> {
  @override
  String s3 = "";

  String s = "hello";
  Widget build(BuildContext context) {
    setState(() {
      l = widget.text;
    });
    var users = FirebaseFirestore.instance.collection("stet");
    var cu = FirebaseAuth.instance.currentUser;
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
          child: Text("Candidate Details",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.transparent,
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
              SizedBox(height: 100),
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.account_circle, color: Colors.black),
                  iconSize: 150,
                ),
              ),
              SizedBox(height: 30),
              Text("Personal Details",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.centerLeft,
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
                    rows: [
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[0],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[0],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[1],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[1],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[2],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[2],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[3],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[3],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[4],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[4],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[5],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[5],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[6],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[6],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[7],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[7],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[8],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[8],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[9],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[9],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[10],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[10],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[11],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[11],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[12],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[12],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[13],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[13],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[28],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[28],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text("Education Details & Applied Role ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.centerLeft,
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
                    rows: [
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[14],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[14],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[15],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[15],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[16],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[16],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[17],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[17],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[18],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[18],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[19],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[19],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[20],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[20],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[21],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[21],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[22],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[22],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[23],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[23],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[24],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[24],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[25],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[25],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[26],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[26],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(l1[27],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                          DataCell(Text(l[27],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: <Widget>[
                    OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Edits(),
                              ));
                        },
                        child: Text("Edit",
                            style: TextStyle(color: Colors.black))),
                    SizedBox(width: 30),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            c = c + 1;
                            print(l);
                            print(l.length);
                            print(l1.length);
                          });
                          List l2 = l1;
                          List l3 = l;
                          Map<String, String> dts = new Map();
                          for (var i = 0; i < 29; i++) {
                            dts[l1[i]] = l[i];
                          }
                          
                          users
                              .doc(cu.uid.toString())
                              .set(dts)
                              .then((value) => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AfterSubmit(),
                                        ))
                                  });
                        },
                        child: Text("Submit",
                            style: TextStyle(color: Colors.black))),
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