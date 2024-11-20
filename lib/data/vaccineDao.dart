import 'package:desafio/components/vaccine.dart';
import 'package:desafio/data/database.dart';
import 'package:sqflite/sqflite.dart';

class VaccineDao {
  static String tableSQL = 'CREATE TABLE $_tablename('
      '$_date TEXT, '
      '$_title TEXT)';

  static const String _tablename = 'vaccines';
  static const String _date = 'date';
  static const String _title = 'title';

  save(Vaccine vaccine) async {
    final Database db = await getDataBase();
    var itemExists = await find(vaccine.title);
    Map<String, dynamic> vaccineMap = toMap(vaccine);

    if (itemExists.isEmpty) {
      return await db.insert(_tablename, vaccineMap);
    } else {
      return await db.update(
        _tablename,
        vaccineMap,
        where: '$_title = ?',
        whereArgs: [vaccine.title],
      );
    }
  }

  delete(String tituloDoCapitulo) async {
    final Database db = await getDataBase();
    return db.delete(
      _tablename,
      where: "$_title = ?",
      whereArgs: [tituloDoCapitulo],
    );
  }

  Future<List<Vaccine>> find(String nomeVacina) async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_title = ?',
      whereArgs: [nomeVacina],
    );

    return toList(result);
  }

  Future<List<Vaccine>> findAll() async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    return toList(result);
  }

  List<Vaccine> toList(List<Map<String, dynamic>> mapaDeVacinas) {
    final List<Vaccine> vaccines = [];

    for (Map<String, dynamic> linha in mapaDeVacinas) {
      final Vaccine vaccine = Vaccine(
        title: linha[_title],
        date: linha[_date],
      );
      vaccines.add(vaccine);
    }
    return vaccines;
  }

  Map<String, dynamic> toMap(Vaccine vaccine) {
    final Map<String, dynamic> mapaDeVacinas = Map();
    mapaDeVacinas[_title] = vaccine.title;
    mapaDeVacinas[_date] = vaccine.date;
    return mapaDeVacinas;
  }
}
