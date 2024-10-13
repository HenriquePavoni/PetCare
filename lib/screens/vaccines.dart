import 'package:desafio/components/vaccine.dart';
import 'package:desafio/screens/primeiraTela.dart';
import 'package:flutter/material.dart';

class Vaccines extends StatefulWidget {
  const Vaccines({Key? key}) : super(key: key);

  @override
  State<Vaccines> createState() => _VaccinesState();
}

class _VaccinesState extends State<Vaccines> {
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
            Navigator.pop(context); // Volta para a tela anterior
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
        child: ListView(
          children: const [
            Vaccine(name: 'Vacina antirrábica'),
            Vaccine(name: 'Vacina Cinomose'),
            Vaccine(name: 'Vacina leptospirose'),
            Vaccine(name: 'Vacina Ehrlichiose'),
            Vaccine(name: 'Vacina parainfluenza'),
            Vaccine(name: 'Vacina giardíase'),
            Vaccine(name: 'Vacina Lyme'),
            Vaccine(name: 'Vacina parvovirose'),
          ],
        ),
      ),
    );
  }
}
