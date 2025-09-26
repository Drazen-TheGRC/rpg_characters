import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_characters/screens/create/create_screen.dart';
import 'package:rpg_characters/screens/home/character_card.dart';
import 'package:rpg_characters/services/character_store.dart';
import 'package:rpg_characters/shared/styled_button.dart';
import 'package:rpg_characters/shared/styled_text.dart';

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
              child: Consumer<CharacterStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.getCharacters.length,
                    itemBuilder: (context, index) {
                      return CharacterCard(
                        character: value.getCharacters[index],
                      );
                    },
                  );
                },
              ),
            ),
            //
            StyledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateScreen()),
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
