import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'diaryDao.dart';
import 'vaccineDao.dart';

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'appPetCare.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(DiaryDao.tableSQL);

      db.execute(VaccineDao.tableSQL);
    },
    version: 1,
  );
}
