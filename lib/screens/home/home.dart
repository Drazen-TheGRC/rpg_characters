import 'package:flutter/material.dart';
import 'package:rpg_characters/screens/home/character_card.dart';
import 'package:rpg_characters/shared/styled_button.dart';
import 'package:rpg_characters/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List characters = [
    "Drazen",
    "Mario",
    "Luigi",
    "Peach",
    "Toad",
    "Browser",
    "Koopa",
  ];

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
              onPressed: () {},
              child: StyledHeading(text: "Create New"),
            ),
          ],
        ),
      ),
    );
  }
}
