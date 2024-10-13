import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../const/utils.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper _db = DBHelper._();
  factory DBHelper() {
    return _db;
  }
  Database? _database;

  Future<Database> get dB async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}Tasks';
    final taskList = await openDatabase(path, version: 1, onCreate: _onCreate);
    return taskList;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE Tasks'
        '($taskId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$taskTitle TEXT,'
        '$taskStatus TEXT,'
        '$taskReview TEXT,'
        '$taskPrice TEXT,'
        '$taskImportance TEXT,'
        '$taskDesc TEXT)');
  }
  //CRUD create read update delete

  //insert
  insertTask(task) async {
    Database dBB = await dB;
    dBB.insert('Tasks', task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

//delete
  deleteTask(taskModel) async {
    Database de = await dB;
    de.delete('Tasks', where: '$taskId=?', whereArgs: [taskModel.id]);
  }

//update
  updateTask(model) async {
    Database up = await dB;
    up.update('Tasks', model.toJson(),
        whereArgs: [model.id], where: '$taskId=?');
  }

  Future<List> getAllTasks() async {
    Database db = await dB;
    List<Map<String, dynamic>> maps = await db.query("Tasks");
    return maps.map((e) => e).toList();
    // return maps.map((e) => taskModel.fromJson(e)).toList();
  }
}
