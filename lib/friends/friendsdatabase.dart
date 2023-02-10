import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import 'friendsmodelclass.dart';

class FriendsDBHelper {

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
    String path = join(documentDirectory.path, 'notes.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate );
    return db;
  }

  _onCreate(Database db, int version) async {
    await  db.execute(
      "CREATE TABLE friends (id INTEGER PRIMARY KEY AUTOINCREMENT, fName TEXT NOT NULL, lName TEXT NOT NULL, age INTEGER NOT NULL, address TEXT NOT NULL, gender TEXT NOT NULL)",
    );
  }


  Future<FriendsModelClass> insert(FriendsModelClass friendsModelClass) async {
    var dbClient = await db;
    await dbClient!.insert('friends', friendsModelClass.toMap());
    return friendsModelClass;
  }


  Future<List<FriendsModelClass>> getCartListWithUserId() async {
    var dbClient = await db;

    final List<Map<String, Object?>> queryResult = await dbClient!.query('friends' );
    return queryResult.map((e) => FriendsModelClass.fromMap(e)).toList();

  }

  // Deleting Data From Database
  Future<int> delete(int id) async{
    var dbClient = await db;
    return await dbClient!.delete(
        'friends',
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  // Update Data In Database
  Future<int> update(FriendsModelClass friendsModelClass) async{
    var dbClient = await db;
    return await dbClient!.update(
        "friends",
        friendsModelClass.toMap(),
        where: 'id = ?',
        whereArgs: [friendsModelClass.id]
    );
  }

}