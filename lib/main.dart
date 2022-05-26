import 'package:flutter/material.dart';
import 'package:off_database/dbheleper.dart';
import 'package:off_database/secondpage.dart';
import 'package:off_database/updatedata.dart';
import 'package:sqflite/sqflite.dart';

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
  Database? db;
  List<Map> userdata=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detalldata();
  }
  void detalldata() {
    dbhelepr().getdatabase().then((value) {
      setState(() {
        db=value;
        dbhelepr().viewdata(db!).then((listofmap) {
          setState(() {
            userdata=listofmap;
          });
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),onPressed: () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return second();
      },));
    },),
      appBar: AppBar(title: Center(child: Text("Contact"))),
      body: ListView.builder(itemCount: userdata.length,itemBuilder: (context, index) {
        return ListTile(
          trailing: PopupMenuButton(onSelected: (value) {

          },itemBuilder: (context) {
            return [
              PopupMenuItem(
              child: Text('delete'),onTap:(){
                int id=userdata[index]['ID'];
              dbhelepr.deletedata(id,db!).then((value) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return database();
                  },));
              });
            },),
              PopupMenuItem(
                child: Text('delete'),onTap:(){

                int id=userdata[index]['ID'];
                String number=userdata[index]['NUMBER'];
                String name=userdata[index]['NAME'];
                dbhelepr().updatedata(userdata[index],number,name,db!).then((value) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return update();
                  },));
                });
              },)
            ];
          },),
          subtitle: Text("${userdata[index]['NUMBER']}"),
          leading: Text("${userdata[index]['ID']}"),
          title: Text("${userdata[index]['NAME']}"),
        );
      },),
    );
  }
}
