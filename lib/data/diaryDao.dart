import 'package:desafio/data/database.dart';

import '../components/diary.dart';
import 'package:sqflite/sqflite.dart';

class DiaryDao {
  static String tableSQL = 'CREATE TABLE $_tablename('
      '$_date TEXT, '
      '$_title TEXT, '
      '$_description TEXT, '
      '$_image TEXT)';

  static const String _tablename = 'diaries';
  static const String _date = 'date';
  static const String _title = 'title';
  static const String _description = 'description';
  static const String _image = 'image';

  save(Diary diary) async {
    final Database db = await getDataBase();
    var itemExists = await find(diary.title);
    Map<String, dynamic> diaryMap = toMap(diary);

    if (itemExists.isEmpty) {
      return await db.insert(_tablename, diaryMap);
    } else {
      return await db.update(
        _tablename,
        diaryMap,
        where: '$_title = ?',
        whereArgs: [diary.title],
      );
    }
  }

  Future<List<Diary>> find(String nomeCapitulo) async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_title = ?',
      whereArgs: [nomeCapitulo],
    );

    return toList(result);
  }

  Future<List<Diary>> findAll() async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    return toList(result);
  }

  delete(String tituloDoCapitulo) async {
    final Database db = await getDataBase();
    return db.delete(
      _tablename,
      where: "$_title = ?",
      whereArgs: [tituloDoCapitulo],
    );
  }

  List<Diary> toList(List<Map<String, dynamic>> mapaDeCapitulos) {
    final List<Diary> capitulos = [];

    for (Map<String, dynamic> linha in mapaDeCapitulos) {
      final Diary capitulo = Diary(
        image: linha[_image],
        title: linha[_title],
        description: linha[_description],
        date: linha[_date],
      );
      capitulos.add(capitulo);
    }
    return capitulos;
  }

  Map<String, dynamic> toMap(Diary diary) {
    final Map<String, dynamic> mapaDeCapitulos = Map();
    mapaDeCapitulos[_image] = diary.image;
    mapaDeCapitulos[_title] = diary.title;
    mapaDeCapitulos[_description] = diary.description;
    mapaDeCapitulos[_date] = diary.date;
    return mapaDeCapitulos;
  }
}
