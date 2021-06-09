import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
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
  "Name of the College/University",
  "Post Graduation Percentage",
  "Post Graduation Passing Year",
];

class _DetailsPage extends State<DetailsPage> {
  @override
  String s3 = "";

  String s = "hello";
  Widget build(BuildContext context) {
    setState(() {
      l = widget.text;
    });
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                        onPressed: () {
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
                    RaisedButton(
                        onPressed: () {
                          setState(() {
                            c = c + 1;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => _submit(),
                              ));
                        },
                        color: Colors.white,
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

class _edits extends StatefulWidget {
  edits createState() => edits();
}

List listtile = ["Education Details", "Personal Details"];
List list;

class edits extends State<_edits> {
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
          child: Text("Candidate Details",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(text: l),
                ));
          },
          label: Text("Update")),
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
        child: Align(
          child: Column(
            children: <Widget>[
              SizedBox(height: 125),
              InkWell(
                onTap: () async {
                  final s = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(text: "2"),
                    ),
                  );
                  String s1 = '$s';
                  print('$s');
                  if (s1.length != 0) {
                    setState(() {
                      l.replaceRange(12, 25, s1.split("#"));
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
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
                            "Education Details Update",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () async {
                  final s = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Personal(text: "3"),
                    ),
                  );
                  String s1 = '$s';
                  print('$s');
                  if (s1.length != 0) {
                    setState(() {
                      l.replaceRange(0, 11, s1.split("#"));
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
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
                            "Personal Details Update",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List l4 = ["hello", "hai"];

class _submit extends StatefulWidget {
  submit createState() => submit();
}

class submit extends State<_submit> {
  bool _value = false;
  static const platform = const MethodChannel("razorpay_flutter");
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_5Bj5mq7OeZif36',
      'amount': 2000 * 10,
      'name': 'STET Exam Fee',
      'description': 'Exam Registration Fee',
      'prefill': {'contact': l[10], 'email': l[11]},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    setState(() {
      _value = !_value;
    });
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName,
        toastLength: Toast.LENGTH_SHORT);
  }

  Razorpay _razorpay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.logout, color: Colors.white),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => login_screen(),
                ));
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
              SizedBox(height: 50),
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
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text("Name",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15))),
                        DataCell(Text(l[2] + l[0] + l[1],
                            style:
                                TextStyle(color: Colors.white, fontSize: 15))),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Registration Number',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15))),
                        DataCell(Text('17121A05H2',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15))),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Gender',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15))),
                        DataCell(Text(l[3],
                            style:
                                TextStyle(color: Colors.white, fontSize: 15))),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Parent details',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15))),
                        DataCell(Text(l[7],
                            style:
                                TextStyle(color: Colors.white, fontSize: 15))),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Date Of Birth')),
                        DataCell(Text(l[6],
                            style:
                                TextStyle(color: Colors.white, fontSize: 15))),
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
                    OutlineButton(
                        onPressed: () {
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
                    OutlineButton(
                        onPressed: () {
                          openCheckout();
                          if (c == 1) {
                            setState(() {
                              _value = !_value;
                            });
                          }
                        },
                        color: Colors.white,
                        child: Text("Payment Status",
                            style: TextStyle(color: Colors.black))),
                    SizedBox(width: 5),
                    Visibility(
                      child: Icon(Icons.check_box_rounded),
                      visible: _value,
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 1),
            ],
          ),
        ),
      ),
    );
  }
}
