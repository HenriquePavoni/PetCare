import 'package:flutter/material.dart';

import '../components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  bool opacidade = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pet Care',
          style: TextStyle(fontFamily: 'Roboto', fontSize: 40, color: Colors.white),
        ),
        backgroundColor: Color(0xFF001D3D),
        centerTitle: true,
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Container(
          color: Colors.amberAccent,
          child: ListView(
            children: const [
              Task("Vacinas", "assets/images/21251.jpg"),
              Task("Comidas", "assets/images/21251.jpg"),
              Task("Diario", "assets/images/21251.jpg"),
            ],
          ),
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
