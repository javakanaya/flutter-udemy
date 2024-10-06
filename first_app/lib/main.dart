import 'package:first_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer1(colors: [
          Color.fromARGB(255, 221, 116, 42),
          Color.fromARGB(255, 177, 31, 35)
        ]),
      ),
    ),
  );
}
