import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workout_timer/data/source/local/dao/routine_dao.dart';

import 'dao/plan_dao.dart';

class DatabaseManager {
  static final _databaseName = "workout_timer.db";
  static final _databaseVersion = 1;

  DatabaseManager._privateConstructor();
  static final DatabaseManager instance = DatabaseManager._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(PlanDao().onCreateStatement());
    await db.execute(RoutineDao().onCreateStatement());
    // await db.execute(AnswerDao().onCreateStatement());
  }
}
