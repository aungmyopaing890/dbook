import 'dart:io';
import 'package:dbook/core/viewobject/book.dart';
import 'package:dbook/core/viewobject/change_password.dart';
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
    const intType = 'INT NOT NULL';

    await db.execute('''
      CREATE TABLE $tableUser ( 
        ${UserFields.id} $idType, 
        ${UserFields.name} $textType,
        ${UserFields.email} $textType UNIQUE,
        ${UserFields.password} $textType
        )
      ''');
    await db.execute('''
      CREATE TABLE $tableBook ( 
        ${BooksFields.id} $idType, 
        ${BooksFields.title} $textType,
        ${BooksFields.authors} $textType,
        ${BooksFields.subtitle} $textType,
        ${BooksFields.image} $textType,
        ${BooksFields.url} $textType,
        ${BooksFields.description} $textType,
        ${BooksFields.publisher} $textType,
        ${BooksFields.pages} $textType,
        ${BooksFields.year} $textType,
        ${BooksFields.download} $textType,
        ${BooksFields.status} $textType,
        ${BooksFields.isFavourite} $intType
        )
      ''');
  }

  /////////////////////////////////////// Start User //////////////////////////////////////

  Future<List<User>> fetchUsers() async {
    final db = await database;
    var itemMapList = await db.query(tableUser, orderBy: "id ASC");
    return List<User>.from(itemMapList.map((x) => User().fromMap(x)));
  }

  Future<ChangePasswordReturn> changeUserPassword({
    required String id,
    required String oldPassword,
    required String newPassword,
  }) async {
    var db = await database;
    var itemMapList = await db.query(tableUser,
        columns: UserFields.values,
        where: '${UserFields.id} = ? AND ${UserFields.password} = ?',
        whereArgs: [id, oldPassword]);
    if (itemMapList.isEmpty) {
      return ChangePasswordReturn(
          success: false, message: "Old Password Wrong!");
    } else {
      await db.update(
          tableUser,
          {
            UserFields.password: newPassword,
          },
          where: 'id = ?',
          whereArgs: [int.parse(id.toString())]);
      return ChangePasswordReturn(
          data: "Success", success: true, message: "Password Changed!");
    }
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
      UserFields.id: user.id,
      UserFields.name: user.name,
      UserFields.email: user.email,
      UserFields.password: user.password
    });
    if (id == 0) {
      // throw 'No rows were inserted to User';
      return UserData(success: false, message: "No rows were inserted to User");
    } else {
      User? data = await getUserByID(id.toString());
      return UserData(user: data, success: true, message: "Success");
    }
  }

  Future<UserData> checkUser(String userName, String password) async {
    final db = await database;
    var itemMapList = await db.query(tableUser,
        columns: UserFields.values,
        where: '${UserFields.name} = ? AND ${UserFields.password} = ?',
        whereArgs: [userName, password]);
    if (itemMapList.isEmpty) {
      return UserData(success: false, message: "UserName or Password Wrong!");
    } else {
      return UserData(
          user: User().fromMap(itemMapList[0]),
          success: true,
          message: "Login Success!");
    }
  }

  /////////////////////////////////////// End User //////////////////////////////////////
  ///
  /////////////////////////////////////// Start Book //////////////////////////////////////
  Future<List<Book>> fetchBooks() async {
    final db = await database;
    var itemMapList = await db.query(tableBook);
    return List<Book>.from(itemMapList.map((x) => User().fromMap(x)));
  }

  Future<List<Book>> getFavBooks() async {
    final db = await database;
    var itemMapList = await db.query(tableBook,
        where: '${BooksFields.isFavourite} = ?', whereArgs: [1]);
    return List<Book>.from(itemMapList.map((x) => User().fromMap(x)));
  }

  Future<int> insertBook(Book book) async {
    final db = await database;
    return await db.insert(tableBook, Book().toMap(book));
  }

  Future<List<Book>> insertBookList(List<Book> books) async {
    books.map((e) async => await insertBook(e));
    return fetchBooks();
  }

  Future<List<Book>> favBook(String id, bool isFavourite) async {
    final db = await database;
    await db.update(
        tableBook,
        {
          BooksFields.isFavourite: isFavourite == true ? 1 : 0,
        },
        where: 'id = ?',
        whereArgs: [int.parse(id)]);
    return getFavBooks();
  }

  Future<List<Book>> deleteBooks() async {
    final db = await database;
    await db.delete(tableBook,
        where: '${BooksFields.isFavourite} = ?', whereArgs: [0]);
    return getFavBooks();
  }

  /////////////////////////////////////// End Book //////////////////////////////////////
  ///
  close() async {
    var db = await database;
    var result = db.close();
    return result;
  }
}
