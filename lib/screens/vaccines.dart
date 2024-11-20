import 'package:desafio/components/vaccine.dart';
import 'package:desafio/data/vaccineDao.dart';
import 'package:desafio/screens/addVaccine.dart';
import 'package:flutter/material.dart';

class Vaccines extends StatefulWidget {
  const Vaccines({super.key});

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
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Vacinas',
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
        child: FutureBuilder<List<Vaccine>>(
          future: VaccineDao().findAll(),
          builder: (context, snapshot) {
            List<Vaccine>? items = snapshot.data;
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
                        final Vaccine vaccine = items[index];
                        return vaccine;
                      },
                    );
                  }
                  return const Center(
                    child: Column(
                      children: [
                        Icon(Icons.error_outline,
                            size: 128, color: Colors.white),
                        Text(
                          "Nao ha nenhuma vacina",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        )
                      ],
                    ),
                  );
                }
                return Text('Erro ao carregar vacinas');
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
              builder: (contextNew) => AddVaccine(vaccineContext: context),
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
