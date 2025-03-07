import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neon Revenant',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(), // Página de inicio
    );
  }
}
