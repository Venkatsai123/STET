import 'package:flutter/material.dart';
import 'role.dart';
import 'education.dart';

String s;

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
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => select_screen(),
                    ),
                  );
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
