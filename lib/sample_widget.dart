import 'package:flutter/material.dart';

class SampleWidget extends StatelessWidget {
  const SampleWidget({super.key, required this.color, required this.label});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Text(
          'Place content of $label Tab here',
          style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 222, 222, 222),
              fontWeight: FontWeight.w400),
        )
      ]),
    );
  }
}
