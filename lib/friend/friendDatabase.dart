import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

import 'friendmodelclass.dart';
class DBHelper {

  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'friends.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate );
    return db;
  }

  _onCreate(Database db, int version) async {
    await  db.execute(
      "CREATE TABLE myFriend (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, age NUMBER NOT NULL, gender TEXT NOT NULL)",
    );
  }


  Future<FriendModelClass> insert(FriendModelClass friendsModel) async {
    var dbClient = await db;
    await dbClient!.insert('myFriend', friendsModel.toMap());
    return friendsModel;
  }


  Future<List<FriendModelClass>> getCartListWithUserId() async {
    var dbClient = await db;

    final List<Map<String, Object?>> queryResult = await dbClient!.query('myFriend' );
    return queryResult.map((e) => FriendModelClass.fromMap(e)).toList();

  }

  // Deleting Data From Database
  Future<int> delete(int id) async{
    var dbClient = await db;
    return await dbClient!.delete(
        'myFriend',
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  // Update Data In Database
  Future<int> update(FriendModelClass friendsModel) async{
    var dbClient = await db;
    return await dbClient!.update(
        "myFriend",
        friendsModel.toMap(),
        where: 'id = ?',
        whereArgs: [friendsModel.id]
    );
  }

}