import 'package:desafio/components/diary.dart';
import 'package:desafio/data/diaryData.dart';
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
      ),
      body: Container(
        color: Colors.amberAccent,
        child: ListView.builder(
          itemCount: DiaryInherited.of(context).diaryList.length,
          itemBuilder: (context, index) {
            final diary = DiaryInherited.of(context).diaryList[index];
            return Diary(
              image: diary.image,
              title: diary.title,
              description: diary.description,
              date: diary.date,
            );
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
          ).then((_) {
            setState(() {});
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
