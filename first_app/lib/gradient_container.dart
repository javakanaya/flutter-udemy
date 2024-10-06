import 'package:first_app/dice_roller.dart';
import 'package:first_app/styled_text.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer1 extends StatelessWidget {
  // constructor functions
  // forwarding key to the parent class
  const GradientContainer1({super.key, required this.colors});

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: colors, begin: startAlignment, end: endAlignment),
        ),
        child: const Center(
          child: DiceRoller(),
        ));
  }
}

class GradientContainer2 extends StatelessWidget {
  // constructor functions
  // forwarding key to the parent class
  const GradientContainer2(this.color1, this.color2, {super.key});

  const GradientContainer2.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.indigo;

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color1, color2], begin: startAlignment, end: endAlignment),
      ),
      child: const Center(
        child: StyledText("Hello World!"),
      ),
    );
  }
}
