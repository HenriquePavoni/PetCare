import 'package:desafio/data/database.dart';

import '../components/diary.dart';
import 'package:sqflite/sqflite.dart';

class PetDao {
  static String tableSQL = 'CREATE TABLE $_tablename('
      '$_date TEXT, '
      '$_title TEXT, '
      '$_description TEXT, '
      '$_image TEXT)';

  static const String _tablename = 'vaccines';
  static const String _date = 'date';
  static const String _title = 'title';
  static const String _description = 'description';
  static const String _image = 'image';

  save(Diary diary) async {
    print('Iniciando o save:');
    final Database db = await getDataBase();
    var itemExists = await find(diary.title);
    Map<String, dynamic> diaryMap = toMap(diary);

    if (itemExists.isEmpty) {
      print('O capitulo nao existia');
      return await db.insert(_tablename, diaryMap);
    } else {
      print('O capitulo ja existia !');
      return await db.update(
        _tablename,
        diaryMap,
        where: '$_title = ?',
        whereArgs: [diary.title],
      );
    }
  }

  Future<List<Diary>> find(String nomeCapitulo) async {
    print("Acessando find: ");
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_title = ?',
      whereArgs: [nomeCapitulo],
    );

    print("Tarefa encontrada: ${toList(result)}");
    return toList(result);
  }

  Future<List<Diary>> findAll() async {
    print('Acessando o findAll: ');
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    print("Procurando dados no banco de dados... encontrado: $result");
    return toList(result);
  }

  delete(String tituloDoCapitulo) async {
    print("Deletando capitulo: $tituloDoCapitulo");
    final Database db = await getDataBase();
    return db.delete(
      _tablename,
      where: "$_title = ?",
      whereArgs: [tituloDoCapitulo],
    );
  }

  List<Diary> toList(List<Map<String, dynamic>> mapaDeCapitulos) {
    print("Convertendo to list:");
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
    print('Lista de capitulos');
    return capitulos;
  }

  Map<String, dynamic> toMap(Diary diary) {
    print('Convertendo tarefa em map');
    final Map<String, dynamic> mapaDeCapitulos = Map();
    mapaDeCapitulos[_image] = diary.image;
    mapaDeCapitulos[_title] = diary.title;
    mapaDeCapitulos[_description] = diary.description;
    mapaDeCapitulos[_date] = diary.date;
    print('Mapa de capitulos: $mapaDeCapitulos');
    return mapaDeCapitulos;
  }
}
