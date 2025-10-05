import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_characters/screens/create/create_screen.dart';
import 'package:rpg_characters/screens/home/home.dart';
import 'package:rpg_characters/services/character_store.dart';
import 'package:rpg_characters/theme.dart';

// This is Firebase stuff
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

void main() async {
  // Firebase stuff
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Flutter stuff
  runApp(
    ChangeNotifierProvider(
      create: (context) => CharacterStore(),
      child: MaterialApp(
        theme: primaryTheme,
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
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
