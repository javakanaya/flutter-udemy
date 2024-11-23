import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/grocery_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 66, 118, 126),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 146, 155, 163),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 38, 38, 38),
      ),
      home: GroceryList(),
    );
  }
}
