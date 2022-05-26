import 'package:flutter/material.dart';
import 'package:off_database/dbheleper.dart';
import 'package:sqflite/sqflite.dart';

import 'main.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  Database? db;
  bool namestatus=false;
  bool numberstatus=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatabas();
  }
  void getdatabas() {
    dbhelepr().getdatabase().then((value) {
      setState(() {
        db=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Contact"))),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(20),
          child: TextField(controller: name,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "enter name",labelText: "name",
              errorText: namestatus?"enter valid name" :null,
            ),
          ),),
        Container(
          margin: EdgeInsets.all(20),
          child: TextField(controller: number,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "enter number",labelText: "number",
              errorText: numberstatus?"enter valid number":null,
            ),
          ),),
        ElevatedButton(onPressed: () {

          namestatus=false;
          numberstatus=false;

          String t1=name.text;
          String t2=number.text;


          setState(() {

            if(t1.isEmpty)
            {
              namestatus=true;
            }
            else if(t2.isEmpty)
            {
              numberstatus=true;
            }
            else
            {
              dbhelepr().insertdata(t1,t2,db!).then((value) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return database();
                },));
              });
            }
          });
        }, child: Text("insert data"))
      ],),
    );
  }
  TextEditingController name=TextEditingController();
  TextEditingController number=TextEditingController();




}
