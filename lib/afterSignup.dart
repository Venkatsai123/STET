import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/personal.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_1/display.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'education.dart';
import 'main.dart';
import 'personal.dart';
import 'editspage.dart';


class AfterSubmit extends StatefulWidget {
  submit createState() => submit();
}

class submit extends State<AfterSubmit> {
  Razorpay _razorpay;
  bool _value = false;
  static const platform = const MethodChannel("razorpay_flutter");
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  getData(String uid) async {
    var d;
    var users = FirebaseFirestore.instance.collection("stet");
    return await users.doc(uid).get();
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
      FirebaseFirestore.instance
          .collection("stet")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .set({"PaymentStatus": "paid"});
    });
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        toastLength: Toast.LENGTH_SHORT);
    FirebaseFirestore.instance
        .collection("stet")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .set({"PaymentStatus": "notpaid"});
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    var cu = FirebaseAuth.instance.currentUser;
    var auth = FirebaseAuth.instance;
    var user = FirebaseFirestore.instance.collection("stet");

    return FutureBuilder(
      future: getData(cu.uid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var gotd = snapshot.data;
          print("in After SignUp Screen bro");

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.logout, color: Colors.white),
                onPressed: () {
                  auth.signOut().then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => login_screen(),
                        ));
                  });
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))),
                              DataCell(Text(
                                  gotd["First Name"] +
                                      " " +
                                      gotd["Middle Name"],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Registration Number',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))),
                              DataCell(Text('17121A05H2',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Gender',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))),
                              DataCell(Text(gotd["Gender"],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Parent details',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))),
                              DataCell(Text(gotd["Father Name"],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Date Of Birth',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))),
                              DataCell(Text(gotd["Date of Birth"],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Role',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))),
                              DataCell(Text(gotd["Role"],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))),
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
                                      builder: (context) => Edits(),
                                    ));
                              },
                              color: Colors.white,
                              child: Text("Edit",
                                  style: TextStyle(color: Colors.black))),
                          SizedBox(width: 30),
                          OutlinedButton(
                              onPressed: () {
                                auth.signOut().then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => login_screen(),
                                      ));
                                });
                              },
                              child: Text("Logout",
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
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
