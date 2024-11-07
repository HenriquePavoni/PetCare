import 'package:desafio/screens/diarys.dart';
import 'package:desafio/screens/foods.dart';
import 'package:flutter/material.dart';
import '../components/task.dart';

class Primeiratela extends StatefulWidget {
  const Primeiratela({Key? key}) : super(key: key);

  @override
  State<Primeiratela> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<Primeiratela> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: ListView(
          children: [
            Task("Comidas Permitidas",
                "assets/images/view-adorable-dog-with-bowl-food.jpg",
                onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Foods();
                }),
              );
            }),
            Task(
              "Diário",
              "assets/images/boy-drawing-with-charcoal-with-dog.jpg",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Diarys();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
