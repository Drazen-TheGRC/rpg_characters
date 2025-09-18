import 'package:flutter/material.dart';
import 'package:rpg_characters/screens/create/create.dart';
import 'package:rpg_characters/screens/home/character_card.dart';
import 'package:rpg_characters/shared/styled_button.dart';
import 'package:rpg_characters/shared/styled_text.dart';

import '../../models/character.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle(text: "Your Characters")),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            //
            Expanded(
              child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  return CharacterCard(character: characters[index]);
                },
              ),
            ),
            //
            StyledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Create()),
                );
              },
              child: StyledHeading(text: "Create New"),
            ),
          ],
        ),
      ),
    );
  }
}
