import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'petDao.dart';

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'pet.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(PetDao.tableSQL);
    },
    version: 1,
  );
}
