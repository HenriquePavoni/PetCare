import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:desafio/model/vaccineModel.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'vaccines.db');
    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE vaccines(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, checked INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertVaccine(VaccineModel vaccine) async {
    final db = await database;
    await db.insert(
      'vaccines',
      vaccine.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<VaccineModel>> getVaccines() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('vaccines');

    return List.generate(maps.length, (i) {
      return VaccineModel.fromMap(maps[i]);
    });
  }
}
