import 'package:flutter/material.dart';
import 'package:off_database/secondpage.dart';

void main()
{
  runApp(MaterialApp(home: database(),));
}
class database extends StatefulWidget {
  const database({Key? key}) : super(key: key);

  @override
  State<database> createState() => _databaseState();
}

class _databaseState extends State<database> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return second();
      },));
    },),
      appBar: AppBar(title: Center(child: Text("Contact"))),
    );
  }
}
