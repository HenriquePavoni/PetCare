import 'package:desafio/data/vaccineDao.dart';
import 'package:flutter/material.dart';

class Vaccine extends StatefulWidget {
  final String date;
  final String title;

  const Vaccine({super.key, required this.title, required this.date});

  @override
  State<Vaccine> createState() => _VaccineState();
}

class _VaccineState extends State<Vaccine> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(width: 5, color: Colors.black),
          color: Colors.blue,
        ),
        width: 350,
        height: 100,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      widget.date,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text('Tem certeza que deseja apagar ?'),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        VaccineDao().delete(widget.title);
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Sim'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Nao'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                    icon: Icon(Icons.close))
              ],
            ),
            Container(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
