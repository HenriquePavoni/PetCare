import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'diaryDao.dart';

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'petCare.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(DiaryDao.tableSQL);
    },
    version: 1,
  );
}
