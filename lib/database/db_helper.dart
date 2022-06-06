import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as io;
import 'package:todo_app/models/model_todo.dart';

class DbHelper {
  Database? _database;

  static const String dbName = "todo.db";
  static const int dbVersion = 12;
  static const int dbNewVersion = 6;
  static const String tableName = "todos";
  static const String columnId = "id";
  static const String columnTitle = "title";
  static const String columnDescription = "description";
  static const String columnCreatedAt = "createdAt";
  static const String columnModifideAt = "modifideAt";

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  Future<Database?> initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = io.join(databasesPath, dbName);
    // open the database
    _database = await openDatabase(
      path,
      version: dbVersion,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY, $columnTitle TEXT, $columnDescription TEXT)');
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {
        if (oldVersion < newVersion) {
          db.execute('ALTER TABLE todos ADD COLUMN createdAt TEXT');
          db.execute('ALTER TABLE todos ADD COLUMN modifideAt TEXT');
        }
      },
    );
    return _database;
  }

  // add todos
  Future<int> addTodo(ModelTodo todo) async {
    final db = await database;
    var result;
    try {
      result = db.insert(tableName, todo.toMap());
    } catch (e) {
      debugPrint("Add to TODO Function : $result");
    }

    return result;
  }

  // Delete todo
  Future<int> deleteTodo(int id) async {
    final db = await database;
    var result = db.delete(tableName, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Update Todo
  Future updateTodo(ModelTodo todo) async {
    final db = await database;
    var result = db
        .update(tableName, todo.toMap(), where: "id = ?", whereArgs: [todo.id]);
    return result;
  }

  // Get all todos
  Future<List<ModelTodo>> getAllTodos() async {
    final db = await database;
    List<ModelTodo> todos = [];
    var results = await db.rawQuery("SELECT * FROM $tableName").then((results) {
      results.forEach((element) {
        ModelTodo modelTodo = ModelTodo.fromMap(element);
        todos.add(modelTodo);
      });
    }).onError((error, stackTrace) {
      debugPrint("Error getAllTodos() : ${error.toString()}");
    });

    return todos;
  }

  // Get todo by id
  Future<ModelTodo?> getProductById(int id) async {
    final db = await database;
    var result = await db.query(tableName, where: "id = ", whereArgs: [id]);
    return result.isNotEmpty ? ModelTodo.fromMap(result.first) : null;
  }
}
