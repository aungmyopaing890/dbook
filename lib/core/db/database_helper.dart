import 'dart:io';
import 'package:dbook/core/viewobject/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../config/master_config.dart';

class DatabaseHelper {
  static Database? _itemDb;
  static DatabaseHelper? _itemDatabaseHelper;

  // Singleton instance
  static final DatabaseHelper _singleton = DatabaseHelper._internal();

  // Singleton accessor
  static DatabaseHelper get instance => _singleton;

  DatabaseHelper._internal();

  static final DatabaseHelper db = DatabaseHelper._internal();
  factory DatabaseHelper() {
    _itemDatabaseHelper = DatabaseHelper._internal();

    return _itemDatabaseHelper!;
  }
  Future<Database> get database async {
    _itemDb = await initializeDatabase();
    return _itemDb!;
  }

  Future<Database> initializeDatabase() async {
    sqfliteFfiInit();
    Directory dir = await getApplicationDocumentsDirectory();
    final dirOfOldAndroidDatabase =
        Directory("${dir.path}/${MasterConfig.app_db_name}");
    if (Platform.isAndroid) {
      if (!await dirOfOldAndroidDatabase.exists()) {
        await dirOfOldAndroidDatabase.create(recursive: true);
      }
    }
    final path = Platform.isIOS
        ? join(dir.path, MasterConfig.app_db_name)
        : join(dir.path.replaceAll("/app_flutter", "/databases"),
            MasterConfig.app_db_name);
    var myDatabase = await databaseFactory.openDatabase(path,
        options: OpenDatabaseOptions(
            version: 1, onCreate: _createDb, onConfigure: _onConfigure));
    return myDatabase;
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  void _createDb(Database db, int newVersion) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    await db.execute('''
      CREATE TABLE $tableUser ( 
        ${MovieFields.id} $idType, 
        ${MovieFields.name} $textType,
        ${MovieFields.email} $textType UNIQUE,
        ${MovieFields.password} $textType
        )
      ''');
  }

  /////////////////////////////////////// Start User //////////////////////////////////////

  Future<List<User>> fetchUsers() async {
    final db = await database;
    var itemMapList = await db.query(tableUser, orderBy: "id ASC");
    return List<User>.from(itemMapList.map((x) => User().fromMap(x)));
  }

  Future<int> updateUser(
    User user,
  ) async {
    var db = await database;
    var result = await db.update(
        tableUser,
        {
          MovieFields.id: user.id,
          MovieFields.name: user.name,
          MovieFields.email: user.email,
          MovieFields.password: user.password,
        },
        where: 'id = ?',
        whereArgs: [int.parse(user.id.toString())]);
    return result;
  }

  Future<int> deleteUser(String id) async {
    var db = await database;
    return await db.delete(tableUser, where: 'id = ?', whereArgs: [id]);
  }

  Future<User?> getUserByID(String id) async {
    final db = await database;
    var itemMapList =
        await db.query(tableUser, where: 'id = ?', whereArgs: [id]);
    return itemMapList.isEmpty
        ? null
        : List<User>.from(itemMapList.map((x) => User().fromMap(x))).first;
  }

  Future<UserData> createUser(User user) async {
    final db = await database;
    final id = await db.insert(tableUser, {
      MovieFields.id: user.id,
      MovieFields.name: user.name,
      MovieFields.email: user.email,
      MovieFields.password: user.password
    });
    if (id == 0) {
      // throw 'No rows were inserted to User';
      return UserData(success: false, message: "No rows were inserted to User");
    } else {
      User? data = await getUserByID(id.toString());
      return UserData(user: data, success: true, message: "Success");
    }
  }

/////////////////////////////////////// End User //////////////////////////////////////
  ///

  close() async {
    var db = await database;
    var result = db.close();
    return result;
  }
}
