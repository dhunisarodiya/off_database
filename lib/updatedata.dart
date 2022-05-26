import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:off_database/dbheleper.dart';

import 'main.dart';

class update extends StatefulWidget {
  const update({Key? key}) : super(key: key);

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  bool namestatus=false;
  bool numberstatus=false;
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

          String newname=name.text;
          String newnumber=name.text;

         dbhelepr().updatedata().then((value) {
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
             return database();
           },));
         });
        }, child: Text("insert data"))
      ],),
    );
  }
  TextEditingController name=TextEditingController();
  TextEditingController number=TextEditingController();


}
