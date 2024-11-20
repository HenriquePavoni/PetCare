import 'package:desafio/components/vaccine.dart';
import 'package:desafio/data/vaccineDao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddVaccine extends StatefulWidget {
  const AddVaccine({super.key, required this.vaccineContext});

  final BuildContext vaccineContext;

  @override
  State<AddVaccine> createState() => _AddVaccineState();
}

class _AddVaccineState extends State<AddVaccine> {
  TextEditingController dateController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Nova Vacina',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFF001D3D),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.topCenter,
            child: Container(
              width: 450,
              height: 265,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blueAccent,
                border: Border.all(width: 3, color: Colors.black26),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {});
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira uma data';
                        }
                        return null;
                      },
                      controller: dateController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Data',
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      readOnly: true,
                      onTap: () {
                        _selectDate();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {});
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira o nome da vacinda';
                        }
                        return null;
                      },
                      controller: titleController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome Vacina',
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                        prefixIcon: Icon(Icons.vaccines),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await VaccineDao().save(
                            Vaccine(
                                title: titleController.text,
                                date: dateController.text),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Salvando novo capitulo'),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: const Text('Adicionar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      setState(() {
        dateController.text = DateFormat('dd/MM/yyyy').format(_picked);
      });
    }
  }
}
