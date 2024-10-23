import 'package:desafio/components/diary.dart';
import 'package:flutter/material.dart';

class DiaryInherited extends InheritedWidget {
  DiaryInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Diary> diaryList = [];

  void newDiary(String date, String title, String description, String image) {
    diaryList.add(
      Diary(
        date: date,
        title: title,
        description: description,
        image: image,
      ),
    );
  }

  static DiaryInherited of(BuildContext context) {
    final DiaryInherited? result =
        context.dependOnInheritedWidgetOfExactType<DiaryInherited>();
    assert(result != null, 'No found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(DiaryInherited oldWidget) {
    return oldWidget.diaryList.length != diaryList.length;
  }
}
