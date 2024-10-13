import 'package:flutter/material.dart';

class Vaccine extends StatefulWidget {
  final String name;

  const Vaccine({super.key, required this.name});

  @override
  State<Vaccine> createState() => _VaccineState();
}

class _VaccineState extends State<Vaccine> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          color: Colors.white,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 50,
                child: Transform.scale(
                  scale: 3.0,
                  child: Checkbox(
                    value: isChecked,
                    checkColor: Colors.orange,
                    onChanged: (newBool) {
                      setState(() {
                        isChecked = newBool ?? false;
                      });
                    },
                  ),
                ),
              ),
              Container(
                width: 300,
                child: Text(
                  textAlign: TextAlign.center,
                  widget.name,
                  style: const TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
