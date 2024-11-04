import 'package:desafio/components/diary.dart';
import 'package:desafio/data/diaryData.dart';
import 'package:desafio/data/petDao.dart';
import 'package:desafio/screens/addDiary.dart';
import 'package:flutter/material.dart';

class Diarys extends StatefulWidget {
  const Diarys({Key? key}) : super(key: key);

  @override
  State<Diarys> createState() => _DiarysState();
}

class _DiarysState extends State<Diarys> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Pet Care',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 40,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF001D3D),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh, color: Colors.white))
        ],
      ),
      body: Container(
        color: Colors.amberAccent,
        child: FutureBuilder<List<Diary>>(
          future: PetDao().findAll(),
          builder: (context, snapshot) {
            List<Diary>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                Center(
                  child: Column(
                    children: [CircularProgressIndicator(), Text('Carregando')],
                  ),
                );
                break;
              case ConnectionState.waiting:
                Center(
                  child: Column(
                    children: [CircularProgressIndicator(), Text('Carregando')],
                  ),
                );
                break;
              case ConnectionState.active:
                Center(
                  child: Column(
                    children: [CircularProgressIndicator(), Text('Carregando')],
                  ),
                );
                break;
              case ConnectionState.done:
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Diary diary = items[index];
                        return diary;
                      },
                    );
                  }
                  return const Center(
                    child: Column(
                      children: [
                        Icon(Icons.error_outline,
                            size: 128, color: Colors.white),
                        Text(
                          "Nao ha nenhum capitulo",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        )
                      ],
                    ),
                  );
                }
                return Text('Erro ao carregar capitulos');
                break;
            }
            return Text('Erro desconhecido');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => AddDiary(diaryContext: context),
            ),
          ).then((value) {
            setState(() {});
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
