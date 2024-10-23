import 'package:flutter/material.dart';

class Vaccine extends StatelessWidget {
  final String name;
  final bool vacinado;
  final ValueChanged<bool?> onChanged;

  const Vaccine({
    super.key,
    required this.name,
    required this.vacinado,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        color: Colors.white,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 50,
              child: Transform.scale(
                scale: 3.0,
                child: Checkbox(
                  value: vacinado,
                  checkColor: Colors.orange,
                  onChanged: onChanged,
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: Text(
                textAlign: TextAlign.center,
                name,
                style: const TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
