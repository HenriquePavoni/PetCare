import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:desafio/components/vaccine.dart';

class Vaccines extends StatefulWidget {
  const Vaccines({Key? key}) : super(key: key);

  @override
  State<Vaccines> createState() => _VaccinesState();
}

class _VaccinesState extends State<Vaccines> {
  final List<bool> _checkedStates = List.filled(9, false);
  final List<String> _vacinas = [
    'Vacina V8/V10',
    'Vacina Antirrábica',
    'Vacina contra a Tosse dos Canis',
    'Vacina contra a Leishmaniose',
    'Vacina contra a Giardíase',
    'Vacina contra a Parainfluenza',
    'Vacina V4/V5',
    'Vacina contra a Leucemia Felina',
    'Vacina contra a Clamidofilose',
  ];

  @override
  void initState() {
    super.initState();
    _loadCheckboxStates();
  }

  Future<void> _loadCheckboxStates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < _checkedStates.length; i++) {
      _checkedStates[i] = prefs.getBool('vaccine_$i') ?? false;
    }
    setState(() {});
  }

  Future<void> _saveCheckboxState(int index, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('vaccine_$index', value);
  }

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
          itemCount: _checkedStates.length,
          itemBuilder: (context, index) {
            return Vaccine(
              name: _vacinas[index],
              vacinado: _checkedStates[index],
              onChanged: (bool? newValue) {
                setState(() {
                  _checkedStates[index] = newValue ?? false;
                  _saveCheckboxState(index, _checkedStates[index]);
                });
              },
            );
          },
        ),
      ),
    );
  }
}
