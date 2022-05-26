import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class dbhelepr
{
  Future<Database> getdatabase()
  async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'create table contactbook (ID integer primary key autoincrement , NAME text , NUMBER text)');
        });
    return database;
  }

  Future<void> insertdata(String t1, String t2, Database database) async {
    String insertqry="insert into contactbook (NAME,NUMBER) values('$t1','$t2')";

    int cnt=await database.rawInsert(insertqry);
    print(cnt);

  }

  Future<List<Map>> viewdata(Database database) async {
    String select="select * from contactbook";
    List<Map> list=await database.rawQuery(select);
    print("===$list");
    return list;
  }
  Future<int> deletdata(Database database)
 async {

    int? count=Sqflite.firstIntValue(await database.rawQuery("select * from contactbook"));
    count=await database.rawDelete("delete from contactbook where NAME='$database'");
   await database.close();
   return count;

  }

}