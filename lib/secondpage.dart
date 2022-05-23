import 'package:flutter/material.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {

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
          errorText: namestatus?"enter valid name":null,
          ),
        ),),
        Container(
          margin: EdgeInsets.all(20),
          child: TextField(controller: number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "enter number",labelText: "number",
              errorText: numberstatus?"enter valid number":null,
            ),
          ),),
        ElevatedButton(onPressed: () {

          namestatus=false;
          numberstatus=false;

          String namaa=name.text;
          String numberr=name.text;


          setState(() {
            if(namaa.isEmpty)
              {
                namestatus=true;
              }
            if(numberr.isEmpty)
              {
                numberstatus=true;
              }
          });
        }, child: Text("insert data"))
      ],),
    );
  }
  TextEditingController name=TextEditingController();
  TextEditingController number=TextEditingController();
}
