import 'package:flutter/material.dart';

class Food extends StatelessWidget {
  final String nome;
  final String descricao;
  final String image;

  const Food({
    super.key,
    required this.nome,
    required this.descricao,
    required this.image,
  });

  void _showDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          nome,
          textAlign: TextAlign.center,
        ),
        content: SizedBox(
          width: 400,
          height: 280,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                descricao,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Fechar',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDetails(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(width: 2, color: Colors.grey),
            color: Colors.black12,
          ),
          height: 120,
          width: 120,
          child: ClipRRect(
            child: Image.asset(
              image,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
