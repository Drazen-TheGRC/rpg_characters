import 'package:flutter/material.dart';
import 'package:rpg_characters/screens/create/create.dart';
import 'package:rpg_characters/screens/home/home.dart';
import 'package:rpg_characters/theme.dart';

void main() {
  runApp(
    MaterialApp(
      theme: primaryTheme,
      debugShowCheckedModeBanner: false,
      home: Create(),
    ),
  );
}

class SandBox extends StatelessWidget {
  const SandBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SandBox"), backgroundColor: Colors.red),
      body: Text("SandBox"),
    );
  }
}
