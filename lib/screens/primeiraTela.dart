import 'package:desafio/screens/foods.dart';
import 'package:flutter/material.dart';
import '../components/task.dart';
import 'vaccines.dart';

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
            Task(
              "Vacinas",
              "assets/images/21251.jpg",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const Vaccines();
                  }),
                );
              },
            ),
            Task("Comidas Permitidas", "assets/images/21251.jpg", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Foods();
                }),
              );
            }),
            Task(
              "Diário",
              "assets/images/21251.jpg",
              onTap: () {
                print("Diário clicado!");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        backgroundColor: Colors.blue[100],
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
